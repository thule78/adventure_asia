class AddTextToTailorTour < ActiveRecord::Migration[5.2]
  def change
    add_column :tailor_tours, :text, :text
  end
end
