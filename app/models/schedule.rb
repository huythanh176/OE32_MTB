class Schedule < ApplicationRecord
  belongs_to :movie
  belongs_to :room
  has_many :bookings, dependent: :destroy
  scope :get_schedule_by_day, -> (day){where "start_at like ?", day}
end
