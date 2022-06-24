class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers, id: :uuid do |t|
      t.geometry :geom

      t.timestamps
    end
  end
end
