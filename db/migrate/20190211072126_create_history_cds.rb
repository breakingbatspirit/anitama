class CreateHistoryCds < ActiveRecord::Migration[5.2]
  def change
    create_table :history_cds do |t|
      t.integer :history_id, null: false
      t.integer :cd_id, null: false
      t.integer :history_cd_quantity, null: false
      t.integer :history_cd_price, null: false
      t.string :history_cd_album, null: false

      t.timestamps
    end
  end
end
