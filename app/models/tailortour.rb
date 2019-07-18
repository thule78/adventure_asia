class Tailortour < ApplicationRecord
  validates :head_count, presence: true, numericality: { only_integer: true, greater_than: 1, less_than_or_equal_to: 15 }
  validates :name, presence: true
  validates :email, presence: true, :format => /\A(\S+)@(.+)\.(\S+)\z/
  validates :activity, presence: true
  validates :depature_date, presence: true
  validates :destination, presence: true
  validates :days, presence: true

  def created_date
    created_at.strftime("%b %d, %Y") if created_at
  end

  def start_date
    depature_date.strftime("%b %d, %Y") if depature_date
  end
end
