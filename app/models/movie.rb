class Movie < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :schedules, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.user.name.maximum}
  validates :description, presence: true
  validates :time, presence: true
  validates :picture, presence: true
  scope :sort, -> { order created_at: :desc }
  mount_uploader :picture, PictureUploader
end
