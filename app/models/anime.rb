class Anime < ApplicationRecord
	has_many :cds,dependent: :destroy
end
