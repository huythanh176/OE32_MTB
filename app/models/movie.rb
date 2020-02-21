class Movie < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :schedules, dependent: :destroy
end
