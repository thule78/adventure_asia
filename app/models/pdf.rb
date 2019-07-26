class Pdf < ApplicationRecord
  belongs_to :tour, foreign_key: 'tour_id'

  validates :name, presence: true
  validates :email, presence: true, :format => /\A(\S+)@(.+)\.(\S+)\z/
end
