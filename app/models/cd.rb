class Cd < ApplicationRecord

	#belongs_to :genre
	belongs_to :label
	belongs_to :anime
	has_many :cart_items, dependent: :destroy
	has_many :history_cds, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :discs, inverse_of: :cd, dependent: :destroy
    accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
        # accepts_nested_attributes_forを使うと、親のformに子のフィールドを追加するだけで一気にcreate, updateできるようになる。
        # allow_destroy: trueをつけると子項目の削除ができるようになる。
	has_many :chats,dependent: :destroy

    attachment :cd_image

    # enum
    enum genre_id: {
        '〜1970年代':1,
        '1980年代':2,
        '1990年代':3,
        '2000年代':4,
        '2010年代':5
    }

    # validates :album, presence: true
    # validates :price, presence: true
    # validates :inventory, presence: true

    def self.search(search)
     if search
    	album_result = Cd.where("album LIKE ? ", "%#{search}%")
    	anime_result = Cd.joins(:anime).where("anime_title LIKE ?", "%#{search}%")
    	song_result = Cd.joins(discs: :songs).where("title LIKE ?", "%#{search}%")
    	result = album_result | anime_result | song_result
    	return result
     end
    end

    # validates :disc, presence: true, numericality: {greater_than: 0, less_than: 100}


        def favorited_by?(user)
            puts "------------"
            puts user.id
            favorites.where(user_id: user.id).exists?
        end
end
