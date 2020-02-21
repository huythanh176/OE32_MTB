class Schedule < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :movie
  belongs_to :room
end
