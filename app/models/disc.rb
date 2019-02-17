class Disc < ApplicationRecord

	belongs_to :cd
	has_many :songs, inverse_of: :disc
    accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true

    # validates :order, presence: true, numericality: {greater_than: 0, less_than: 100}
end
