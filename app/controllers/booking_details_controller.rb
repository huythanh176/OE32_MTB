class BookingDetailsController < ApplicationController
  def index
    @bookings = current_user.bookings.sort_by_newest.paginate page: params[:page]
  end
end
