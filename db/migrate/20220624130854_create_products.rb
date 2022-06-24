class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: :uuid do |t|
      t.references :category, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.integer :weight
      t.integer :height
      t.integer :width
      t.integer :length

      t.timestamps
    end
  end
end
