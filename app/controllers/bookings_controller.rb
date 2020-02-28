class BookingsController < ApplicationController
  before_action :load_schedule, only: :new
  before_action :get_payment_id, only: :create

  def new
    load_movie(@schedule.movie_id)
    @booking = current_user.bookings.new
    @seats = Seat.get_seats_by_room(@schedule.room_id)
  end

  def create
    seats = params[:booking][:seats].split(",")
    ActiveRecord::Base.transaction do
      @booking = Booking.create!(booking_params(@payment_id))
      seats.each do |n|
        BookingDetail.create!(booking_id: @booking.id, seat_id: n.to_i)
      end
    end
    flash[:success] = t "booking.create.success"
    redirect_to new_booking_path(id: params[:booking][:schedule_id])
  rescue ActiveRecord::RecordInvalid => exception
    flash[:danger] = exception.message
    redirect_to new_booking_path(id: params[:booking][:schedule_id])
  end

  private

  def booking_params payment_id
    params.require(:booking).permit :user_id, :schedule_id , :payment_id,
                                    :promotion_id
  end

  def load_schedule
    @schedule = Schedule.find_by id: params[:id]
    return if @schedule
    flash[:danger]= t "schedule.not_found"
    redirect_to root_url
  end

  def load_movie schedule_id
    @movie = Movie.find_by id: schedule_id
    return if @movie
    flash[:danger]= t "movies.not_found"
    redirect_to root_url
  end

  def get_payment_id
    payment_id = Payment.find_by(payment_type: params[:booking][:payment_type]).id
    return if payment_id.nil?
    params[:booking][:payment_id] = payment_id
  end
end
