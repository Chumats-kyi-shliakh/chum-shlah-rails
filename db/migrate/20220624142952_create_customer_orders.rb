class CreateCustomerOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_orders, id: :uuid do |t|
      t.references :customer, null: false, foreign_key: true, type: :uuid
      t.jsonb :route
      t.integer :status

      t.timestamps
    end
  end
end
