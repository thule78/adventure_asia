class TailorTour < ApplicationRecord
  validates :head_count, presence: true, numericality: { only_integer: true, greater_than: 1, less_than_or_equal_to: 15 }
  validates :name, presence: true
  validates :email, presence: true, :format => /\A(\S+)@(.+)\.(\S+)\z/
  validates :activity, presence: true
  validates :depature_date, presence: true
  validates :destination, presence: true
  validates :days, presence: true
end
