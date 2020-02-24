class Payment < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
