class Item < ApplicationRecord
	has_many :order_items
	has_many :orders, through: :order_items
	has_many :user_items
	belongs_to :genre
	belongs_to :admin
	has_many :discs
	# accepts_nested_attributes_for を追記
	accepts_nested_attributes_for :discs, allow_destroy: true
	has_many :tracks, through: :discs

	attachment :jacket_image

end
