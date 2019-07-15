class User < ApplicationRecord
  # mailler lewagon
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #following http://railscasts.com/episodes/393-guest-user-record
  #attr_accessor :name, :email, :password

  has_many :tours, class_name: "Tour", foreign_key: 'user_id'
  has_many :bookings, class_name: "Booking", foreign_key: "user_id"

  validates_presence_of :name, :email, :password, unless: :guest?
  validates_uniqueness_of :email

  acts_as_liker

  #http://railscasts.com/episodes/393-guest-user-record
  # def self.new_guest
  #   new { |u| u.guest = true }
  # end

  # def name
  #   guest ? "GUEST" : name
  # end

  # def move_to(user)
  #   tasks.update_all(user_id: user.id)
  # end

  #mailer lewagon
  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
