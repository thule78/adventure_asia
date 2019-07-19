class AddLikeesCountToTour < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :likees_count, :integer, :default => 0
  end
end
