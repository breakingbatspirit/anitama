class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.integer :songs_id, null: false
      t.string :artist_name, null: false

      t.timestamps
    end
  end
end
