class Track < ApplicationRecord
	belongs_to :disc, optional: true, dependent: :destroy

	validates :track_name, presence: true
	validates :track_num, presence: true

end
