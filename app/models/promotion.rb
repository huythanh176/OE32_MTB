class Promotion < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
