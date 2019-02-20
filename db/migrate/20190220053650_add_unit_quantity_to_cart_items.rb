class AddUnitQuantityToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :unit_quantity, :integer, default: 1, null: false
  end
end
