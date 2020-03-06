class Payment < ApplicationRecord
  has_many :bookings, dependent: :destroy
  enum payment_type: {counter: 0, paypal: 1}
end
