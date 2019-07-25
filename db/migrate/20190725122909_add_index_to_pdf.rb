class AddIndexToPdf < ActiveRecord::Migration[5.2]
  def change
    add_column :pdfs, :tour_id, :integer
    add_index :pdfs, :tour_id

  end
end
