class Pattern < ActiveRecord::Base
	has_and_belongs_to_many :tickers
	has_and_belongs_to_many :users
	has_many :scans, through: :pattern_relevance_scans

	# validates :scan_id, presence: true


#Doji constants
	DOJI_OPEN_CLOSE_TO_DAY_RANGE_RATIO = 5.0
	DOJI_MIN_OPEN_CLOSE_SPREAD = 0.03
	DOJI_OPEN_CLOSE_IN_MIDDLE_PERCENT_OF_DAY_RANGE = 0.30
end