class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :payment
  belongs_to :schedule
  belongs_to :promotion
  has_many :booking_details, dependent: :destroy
  scope :sort_by_newest, -> { order created_at: :desc }
end
