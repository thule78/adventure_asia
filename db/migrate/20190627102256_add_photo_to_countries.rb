class AddPhotoToCountries < ActiveRecord::Migration[5.2]
  def change
    add_column :countries, :photo, :string
  end
end
