class Song < ApplicationRecord
	belongs_to :disc
	belongs_to :artist

    # validates :order, presence: true, numericality: {greater_than: 0, less_than: 100}
end
