class Relevance < ActiveRecord::Base
	has_one :pattern
	has_one :scan

	 validates :pattern_id, :scan_id
end