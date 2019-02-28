class Address < ApplicationRecord
	belongs_to :user

    validates :address_name, presence: true
    validates :address_namekana, presence: true
    validates :address_phone, presence: true
    validates :address_postal, presence: true
    validates :address_address, presence: true
    # validates :address_addresss, presence: true, numericality: {greater_than: 0, less_than: 100}
end
