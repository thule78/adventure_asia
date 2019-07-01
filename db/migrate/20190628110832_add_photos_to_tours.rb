class AddPhotosToTours < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :photo, :string
    add_column :tours, :photo_1, :string
    add_column :tours, :photo_2, :string
    add_column :tours, :photo_3, :string
  end
end
