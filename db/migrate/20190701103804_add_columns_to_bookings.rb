class AddColumnsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :name, :string
    add_column :bookings, :email, :string
    add_column :bookings, :hotel, :string
  end
end
