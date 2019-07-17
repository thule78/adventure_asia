class CreateTailorTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tailor_tours do |t|
      t.string :activity
      t.string :comfort
      t.string :theme
      t.date :depature_date
      t.integer :days
      t.integer :head_count
      t.string :hotel
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
