class Disc < ApplicationRecord
	belongs_to :item
	has_many :tracks
end
