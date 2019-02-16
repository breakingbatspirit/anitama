class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.text :body, null: false
      t.integer :cd_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
