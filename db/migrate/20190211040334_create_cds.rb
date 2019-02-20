class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
    	t.text :cd_image_id
    	t.text :album, null: false
    	t.integer :price, null: false
    	t.integer :inventory, null: false
        t.integer :user_id
        t.integer :anime_id, null: false
        t.integer :label_id, null: false
        t.integer :genre_id

        t.timestamps
    end
  end
end
