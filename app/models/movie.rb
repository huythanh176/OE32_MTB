class Movie < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :schedules, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.user.name.maximum}
  validates :description, presence: true
  validates :time, presence: true
  validates :picture, presence: true
  scope :sort_by_newest, -> {order created_at: :desc}
  scope :search_by_name, -> (name){where "name like ?", name}
  mount_uploader :picture, PictureUploader
end
