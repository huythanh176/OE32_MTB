class Room < ApplicationRecord
  has_many :seats, dependent: :destroy
  has_many :schedules, dependent: :destroy
  belongs_to :theater
end
