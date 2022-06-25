class CreateCustomerOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_orders, id: :uuid do |t|
      t.references :customer, null: false, foreign_key: true, type: :uuid
      t.references :cart, null: false, foreign_key: true, type: :uuid
      t.jsonb :route
      t.integer :status, null: false, default: 0
      t.st_point :geom, srid: 4326
      t.string :country
      t.string :city
      t.string :postal_code
      t.string :street
      t.string :house_number


      t.timestamps
    end
  end
end
