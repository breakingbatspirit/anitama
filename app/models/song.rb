class Song < ApplicationRecord
	belongs_to :disc
	belongs_to :artist
end
