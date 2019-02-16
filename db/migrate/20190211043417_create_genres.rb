class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.integer :generation,default: 0, null: false, limit: 1
      t.integer :cd_id

      t.timestamps
    end
  end
end
