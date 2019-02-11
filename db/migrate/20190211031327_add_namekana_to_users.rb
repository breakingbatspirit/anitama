class AddNamekanaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :namekana, :string
    add_column :users, :nickname, :string
    add_column :users, :postal, :string
    add_column :users, :address, :text
    add_column :users, :phone, :string
    add_column :users, :image_id, :text
    add_column :users, :deleted_at, :boolean
  end
end
