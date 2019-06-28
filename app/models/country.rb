class Country < ApplicationRecord
  has_many :locations, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true


  mount_uploader :photo, PhotoUploader
end
