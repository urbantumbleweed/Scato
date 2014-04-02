class Pattern < ActiveRecord::Base
	has_and_belongs_to_many :tickers
	has_and_belongs_to_many :users
	has_many :scans, through: :pattern_relevance_scans

	# validates :scan_id, presence: true
end