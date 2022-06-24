class CreateFunds < ActiveRecord::Migration[7.0]
  def change
    create_table :funds, id: :uuid do |t|
      t.string :name
      t.string :tg_bot_key

      t.timestamps
    end
  end
end
