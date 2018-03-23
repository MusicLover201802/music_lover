class Disc < ApplicationRecord
	belongs_to :item, optional: true
	has_many :tracks, dependent: :destroy
	accepts_nested_attributes_for :tracks, allow_destroy: true
	validates :disc_name, presence: true
	validates :disc_num, presence: true
end
