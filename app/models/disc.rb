class Disc < ApplicationRecord

	belongs_to :cd
	has_many :songs, inverse_of: :disc
    accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true

end
