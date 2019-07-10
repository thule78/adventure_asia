class AddIconToCountries < ActiveRecord::Migration[5.2]
  def change
    add_column :countries, :icon, :string
  end
end
