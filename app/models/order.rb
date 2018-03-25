class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items
	has_many :items, through: :order_items

	accepts_nested_attributes_for :order_items, allow_destroy: true

	validates :postal_code, presence: true
	validates :city, presence: true
	validates :building, presence: true
	validates :phone_number, presence: true
end
