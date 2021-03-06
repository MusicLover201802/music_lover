class UserItem < ApplicationRecord

	belongs_to :user
	belongs_to :item

	# 負の数でカートに入れられないよう制限
	validates :quantity, numericality: { greater_than_or_equal_to: 0 }

end
