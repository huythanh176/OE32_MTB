class User < ApplicationRecord
  has_many :bookings
  has_many :comments, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.user.name.maximum}
  validates :email, presence: true,
                    length: {maximum: Settings.user.email.maximum},
                    format: {with: Settings.user.email.valid},
                    uniqueness: true
  validates :phone, presence: true
  validates :password, presence: true,
                       length: {minimum: Settings.user.password.minimum},
                       allow_nil: true
  before_save :downcase_email
  scope :sort_by_newest, -> {order created_at: :desc}
  has_secure_password
  acts_as_paranoid

  private

  def downcase_email
    email.downcase!
  end
end
