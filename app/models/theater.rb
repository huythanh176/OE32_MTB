class Theater < ApplicationRecord
  has_many :rooms, dependent: :destroy
end
