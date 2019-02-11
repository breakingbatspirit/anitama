class History < ApplicationRecord
	has_many :history_cds,dependent: :destroy
	belongs_to :user
end
