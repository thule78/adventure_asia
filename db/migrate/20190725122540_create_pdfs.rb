class CreatePdfs < ActiveRecord::Migration[5.2]
  def change
    create_table :pdfs do |t|
      t.string :name
      t.string :email
      t.string :tour_name
      t.string :tour_code
      t.boolean :sent

      t.timestamps
    end
  end
end
