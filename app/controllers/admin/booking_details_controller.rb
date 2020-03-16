class Admin::BookingDetailsController < ApplicationController
  def index
    @bookings = Booking.sort_by_newest.paginate page: params[:page]
  end
end
