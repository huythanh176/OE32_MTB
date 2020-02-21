class Schedule < ApplicationRecord
  belongs_to :movie
  belongs_to :room
  has_many :bookings, dependent: :destroy
end
