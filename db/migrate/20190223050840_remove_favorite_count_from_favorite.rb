class RemoveFavoriteCountFromFavorite < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :favorite_count, :integer
  end
end
