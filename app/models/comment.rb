class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  scope :sort_by_newest, -> {order created_at: :desc}
end
