class Location < ApplicationRecord
  belongs_to :country, foreign_key: "country_id"
  has_many :tours, dependent: :delete_all
  validates :name, presence: true
  validates :address, presence: true
end
