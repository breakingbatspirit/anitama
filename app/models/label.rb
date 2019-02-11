class Label < ApplicationRecord
	has_many :cds,dependent: :destroy
end
