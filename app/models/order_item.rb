class OrderItem < ApplicationRecord
	belongs_to :order_item, optional: true
	belongs_to :item, optional: true
end
