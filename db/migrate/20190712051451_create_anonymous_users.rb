class CreateAnonymousUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :anonymous_users do |t|

      t.timestamps
    end
  end
end
