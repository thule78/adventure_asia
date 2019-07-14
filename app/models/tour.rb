class Tour < ApplicationRecord
  belongs_to :providers, class_name: "User", foreign_key: "user_id"
  belongs_to :location
  belongs_to :activity
  has_many :users, through: :bookings
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

  acts_as_taggable_on :tags
  acts_as_likeable

  include PgSearch
  pg_search_scope :search_for_tour,
    against: [:name, :duration, :content, :style, :theme, :comfort, :itinerary],
    associated_against: {:tags => [:name]},
    using: {
      tsearch: { prefix: true }
    }

  def unconfirmed_count
    count = 0
    self.bookings.each do |booking|
      if booking.confirmed.nil?
        count += 1
      end
    end
    count
  end
end
