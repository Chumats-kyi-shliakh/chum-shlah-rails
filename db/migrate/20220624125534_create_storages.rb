class CreateStorages < ActiveRecord::Migration[7.0]
  def change
    create_table :storages do |t|
      t.references :fund, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.st_point :geom, srid: 4326
      t.string :city
      t.string :street
      t.string :postal_code
      t.string :country
      t.string :house_number

      t.timestamps
    end
  end
end
