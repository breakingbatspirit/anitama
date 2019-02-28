class Address < ApplicationRecord
	belongs_to :user

    # validates :address, presence: true, numericality: {greater_than: 0, less_than: 100}
end
