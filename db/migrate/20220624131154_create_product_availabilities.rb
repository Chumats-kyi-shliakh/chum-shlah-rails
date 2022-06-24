class CreateProductAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :product_availabilities, id: :uuid do |t|
      t.references :storage, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.integer :quantity

      t.timestamps
    end
  end
end
