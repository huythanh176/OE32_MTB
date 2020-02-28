class Seat < ApplicationRecord
  belongs_to :room
  has_many :booking_details, dependent: :destroy
  scope :get_seats_by_room , ->(room_id){where "room_id = ?", room_id}
end
