class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :disc_id, null: false
      t.integer :order, null: false
      t.string :title, null: false
      t.integer :artist_id, null: false

      t.timestamps
    end
  end
end
