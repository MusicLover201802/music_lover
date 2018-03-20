class Track < ApplicationRecord
	belongs_to :disc, optional: true
end
