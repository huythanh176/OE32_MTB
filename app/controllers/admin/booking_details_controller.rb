class Admin::BookingDetailsController < ApplicationController
  authorize_resource

  def index
    @bookings = Booking.sort_by_newest.paginate page: params[:page]
  end
end
