class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.text :summary
      t.text :essential_info
      t.text :getting_there
      t.text :getting_around
      t.text :weather_climate
      t.text :visa_permit
      t.text :local_customs
      t.text :festival_events

      t.timestamps
    end
  end
end
