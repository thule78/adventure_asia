class AddIndexToTour < ActiveRecord::Migration[5.2]
  def change
    add_index :tours, :user_id
  end
end
