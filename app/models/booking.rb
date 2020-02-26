class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :payment
  belongs_to :schedule
  belongs_to :promotion
  has_many :booking_details, dependent: :destroy
end
