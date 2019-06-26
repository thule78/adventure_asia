class Country < ApplicationRecord
  has_many :locations, dependent: :delete_all
  validates :name, presence: true
end
