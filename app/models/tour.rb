class Tour < ApplicationRecord
  belongs_to :provider, class_name: "User", foreign_key: "user_id"
  belongs_to :location
  belongs_to :activity
  has_many :customers, through: :bookings
  has_many :bookings, dependent: :delete_all

  validates :name, presence: true
  validates :content, presence: true
  validates :code, presence: true, uniqueness: true
  validates :duration, presence: true
  validates :price, presence: true, numericality: {only_integer: true,
                                                    greater_than_or_equal_to: 30}

  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_1, PhotoUploader
  mount_uploader :photo_2, PhotoUploader
  mount_uploader :photo_3, PhotoUploader
end
