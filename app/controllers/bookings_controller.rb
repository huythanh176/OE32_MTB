class BookingsController < ApplicationController
  before_action :load_schedule, only: :new
  before_action :load_movie, only: :new
  before_action :get_seats_booked, only: :new

  protect_from_forgery except: [:hook]

  def hook
    params.permit!
    status = params[:payment_status]
    if status == "Completed"
      @booking = Booking.find params[:invoice]
      @booking.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end

  def new
    @seats_count = Seat.get_seats_by_room(@schedule.room_id)
    @booking = current_user.bookings.new
  end

  def create
    seats = params[:booking][:seats].split(",")
    ActiveRecord::Base.transaction do
      @booking = current_user.bookings.create!(booking_params)
      seats.each do |n|
        BookingDetail.create!(booking_id: @booking.id, seat_id: n.to_i)
      end
    end
    flash[:success] = t "booking.create.success"
    if params[:booking][:payment_type] == "counter"
      redirect_to booking_details_path
    else
      redirect_to @booking.paypal_url(booking_details_path)
    end
  rescue ActiveRecord::RecordInvalid => exception
    flash[:danger] = exception.message
    redirect_to new_booking_path(id: params[:booking][:schedule_id])
  end

  private

  def load_schedule
    @schedule = Schedule.find_by id: params[:id]
    return if @schedule
    flash[:danger]= t "schedule.not_found"
    redirect_to root_url
  end

  def load_movie
    @movie = Movie.find_by id: @schedule.movie_id
    return if @movie
    flash[:danger]= t "movies.not_found"
    redirect_to root_url
  end

  def booking_params
    params.require(:booking).permit :schedule_id , :payment_type,
                                    :promotion_id
  end

  def get_seats_booked
    @seats_booked = BookingDetail.get_seat_booked_by_schedule(params[:id])
  end
end
