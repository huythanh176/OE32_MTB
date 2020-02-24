class Seat < ApplicationRecord
  has_many :booking_details, dependent: :destroy
  belongs_to :room
end
