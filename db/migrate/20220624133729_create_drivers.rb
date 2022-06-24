class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers, id: :uuid do |t|
      t.string :login
      t.string :encrypted_password
      t.boolean :online
      t.datetime :last_online

      t.timestamps
    end
  end
end
