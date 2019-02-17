class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :disc_number, null: false
      t.integer :cd_id, null: false

      t.timestamps
    end
  end
end
