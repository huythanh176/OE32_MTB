class Schedule < ApplicationRecord
  belongs_to :movie
  belongs_to :room
  has_many :bookings, dependent: :destroy
  scope :get_schedule_by_day, -> (day){where "start_at like ?", "#{day}%"}
  scope :get_schedule_by_theater, -> (theater_id){Schedule.joins(room: :theater)
                                               .where(theaters: {id:theater_id})}
end
