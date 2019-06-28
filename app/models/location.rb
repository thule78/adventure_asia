class Location < ApplicationRecord
  belongs_to :country, foreign_key: "country_id"
  has_many :tours, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :photo, presence: true

   mount_uploader :photo, PhotoUploader
end
