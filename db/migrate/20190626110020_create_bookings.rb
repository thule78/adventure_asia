class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :tour_id
      t.date :date
      t.integer :head_count
      t.boolean :confirmed
      t.text :note
      t.integer :user_id

      t.timestamps
    end
  end
end
