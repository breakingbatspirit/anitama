class Cd < ApplicationRecord
	belongs_to :genre
	belongs_to :label
	belongs_to :anime
	has_many :cart_items,dependent: :destroy
	has_many :history_cds,dependent: :destroy
	has_many :favorites,dependent: :destroy
	has_many :discs, inverse_of: :cd
    accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
        # accepts_nested_attributes_forを使うと、親のformに子のフィールドを追加するだけで一気にcreate, updateできるようになる。
        # allow_destroy: trueをつけると子項目の削除ができるようになる。
	has_many :chats,dependent: :destroy

    attachment :image

    # validates :album, presence: true
    # validates :price, presence: true
    # validates :inventory, presence: true

    # validates :disc, presence: true, numericality: {greater_than: 0, less_than: 100}
end
