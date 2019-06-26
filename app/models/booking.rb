class Booking < ApplicationRecord
  belongs_to :customer, class_name: "User", foreign_key: 'user_id'
  belongs_to :tour
  validates :head_count, presence: true, numericality: { only_integer: true, greater_than: 1, less_than_or_equal_to: 15 }
  validates :date, presence: true
end
