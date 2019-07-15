class AddIndexesToBooking < ActiveRecord::Migration[5.2]
  def change
    add_index :bookings, :user_id
    add_index :bookings, :tour_id
  end
end
