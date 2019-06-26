class Activity < ApplicationRecord
  has_many :tours, dependent: :delete_all
  validates :name, presence: true
end
