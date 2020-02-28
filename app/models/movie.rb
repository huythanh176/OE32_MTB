class Movie < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :schedules, dependent: :destroy
  scope :sort, -> { order created_at: :desc }
end
