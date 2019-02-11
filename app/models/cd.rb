class Cd < ApplicationRecord
	belongs_to :genre
	belongs_to :label
	belongs_to :anime
	has_many :cart_items,dependent: :destroy
	has_many :history_cds,dependent: :destroy
	has_many :favorites,dependent: :destroy
	has_many :discs,dependent: :destroy
	has_many :chats,dependent: :destroy
end
