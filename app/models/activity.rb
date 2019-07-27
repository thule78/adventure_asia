class Activity < ApplicationRecord
  has_many :tours, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
  mount_uploader :icon, PhotoUploader
end
