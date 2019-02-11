class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :status,default: 0, null: false, limit: 1
      t.string :histories_name, null: false
      t.string :histories_namekana, null: false
      t.string :histories_postal, null: false
      t.text :histories_address, null: false
      t.string :histories_phone, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
