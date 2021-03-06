class Item < ApplicationRecord
	has_many :order_items
	has_many :orders, through: :order_items
	has_many :user_items
	belongs_to :genre
	belongs_to :admin
	has_many :discs, dependent: :destroy
	# accepts_nested_attributes_for を追記
	accepts_nested_attributes_for :discs, allow_destroy: true
	has_many :tracks, through: :discs

	attachment :jacket_image

	validates :item_name, presence: true
	validates :artist_name, presence: true
	#全角カナでバリデーションしようとしましたが藤岡弘、モーニング娘。の「、」「。」に反応してエラーが返ってきてしまうのでとりあえずコメントアウトしてます。
	# validates :artist_name_kana, presence: true,
	# 		format: { with: /^[ァ-ンー－]+$/}
	validates :genre_id, presence: true
	validates :price, presence: true
	validates :release_date, presence: true
	validates :admin_id, presence: true

	validates :stock, numericality: { greater_than_or_equal_to: 0 }

end
