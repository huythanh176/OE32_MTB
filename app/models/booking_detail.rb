class BookingDetail < ApplicationRecord
  belongs_to :booking
  belongs_to :seat
  scope :sort_by_newest, -> {order created_at: :desc}
  scope :get_seat_booked_by_schedule, -> (schedule_id){BookingDetail.joins(booking: :schedule)
                                               .where(schedules: {id:schedule_id})
                                               .pluck(:seat_id)}
end
