class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries, id: :uuid do |t|
      t.integer :status
      t.jsonb :route
      t.references :driver, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
