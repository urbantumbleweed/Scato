class Scan < ActiveRecord::Base
	belongs_to :ticker
	has_many :patterns, through: :pattern_relevance_scans

	validates :ticker_id, presence: true
end