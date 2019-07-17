class AddDestinationToTailorTour < ActiveRecord::Migration[5.2]
  def change
    add_column :tailor_tours, :destination, :string
  end
end
