class RemoveUnitQuantityFromCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :unit_quantity, :integer
  end
end
