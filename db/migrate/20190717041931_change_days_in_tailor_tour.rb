class ChangeDaysInTailorTour < ActiveRecord::Migration[5.2]
  def change
    change_column :tailor_tours, :days, :string
  end
end
