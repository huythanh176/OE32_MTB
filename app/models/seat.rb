class Seat < ApplicationRecord
  belongs_to :room
  has_many :booking_details, dependent: :destroy
end
