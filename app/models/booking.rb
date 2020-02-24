class Booking < ApplicationRecord
  has_many :booking_details, dependent: :destroy
  belongs_to :user
  belongs_to :payment
  belongs_to :schedule
  belongs_to :promotion
end
