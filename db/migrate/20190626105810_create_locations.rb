class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.integer :country_id
      t.text :summary
      t.text :sights

      t.timestamps
    end
  end
end
