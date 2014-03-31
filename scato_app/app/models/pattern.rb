class Pattern < ActiveRecord::Base
	has_and_belongs_to_many :tickers
	has_many :scans, through: :patterns_scans

	validates :pattern_id, :scan_id, presence: true
end