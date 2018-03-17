class Item < ApplicationRecord
	has_many :order_items
	has_many :orders, through: :order_items
	has_many :user_items
	belongs_to :genre
	belongs_to :admin
	has_many :discs
	has_many :tracks, through: :discs

	attachment :image
end
