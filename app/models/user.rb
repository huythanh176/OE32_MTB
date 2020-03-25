class User < ApplicationRecord
  has_many :bookings
  has_many :comments, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.user.name.maximum}
  validates :phone, presence: true
  scope :sort_by_newest, -> {order created_at: :desc}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
