class DeleteTourIdFromBooking < ActiveRecord::Migration[5.2]
  def change
  remove_column :bookings, :tour_id
  end
end
