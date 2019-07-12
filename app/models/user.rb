class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :tours, class_name: "Tour", foreign_key: 'user_id'
  has_many :bookings, class_name: "Booking", foreign_key: "user_id"

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  acts_as_liker

  #devise guest http://blog.shivamdaryanani.com/blog/2013/11/21/create-a-guest-user-record-with-devise/
  def move_to(user)
    todos.update_all(user_id: user.id)
  end

end
