class RenameTailorTour < ActiveRecord::Migration[5.2]
  def change
    rename_table :tailor_tours, :tailortours
  end
end
