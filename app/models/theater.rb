class Theater < ApplicationRecord
  has_many :rooms, dependent: :destroy
  scope :sort, -> {order created_at: :desc}
end
