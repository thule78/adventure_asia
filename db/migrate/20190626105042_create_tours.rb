class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :content
      t.text :itinerary
      t.integer :price
      t.string :code
      t.string :duration
      t.string :style
      t.string :theme
      t.string :comfort
      t.string :start_end_des
      t.integer :location_id
      t.integer :activity_id
      t.integer :user_id

      t.timestamps
    end
  end
end
