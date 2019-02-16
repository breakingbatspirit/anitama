class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_name
      t.string :address_namekana
      t.string :address_phone
      t.string :address_postal
      t.text :address_address
      t.integer :user_id

      t.timestamps
    end
  end
end
