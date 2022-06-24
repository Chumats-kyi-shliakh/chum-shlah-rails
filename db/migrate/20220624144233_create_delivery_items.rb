class CreateDeliveryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_items, id: :uuid do |t|
      t.boolean :outdated
      t.integer :status
      t.integer :quantity
      t.references :delivery, null: false, foreign_key: true, type: :uuid
      t.references :cart_item, null: false, foreign_key: true, type: :uuid
      t.references :product_availability, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
