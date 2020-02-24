class BookingDetail < ApplicationRecord
  belongs_to :booking
  belongs_to :seat
end
