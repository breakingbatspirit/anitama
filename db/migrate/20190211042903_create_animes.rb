class CreateAnimes < ActiveRecord::Migration[5.2]
  def change
    create_table :animes do |t|
      t.text :anime_title, null: false
      t.integer :cd_id, null: false

      t.timestamps
    end
  end
end
