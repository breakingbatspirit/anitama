class AddFavoritesCountToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :favorites_count, :integer
  end
end
