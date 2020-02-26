class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.user.name.maximum}
  validates :email, presence: true,
                    length: {maximum: Settings.user.email.maximum},
                    format: {with: Settings.user.email.valid},
                    uniqueness: true
  validates :phone, presence: true
  validates :password, presence: true,
                       length: {minimum: Settings.user.password.minimum}
  before_save :downcase_email
  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
