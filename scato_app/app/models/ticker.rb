class Ticker < ActiveRecord::Base
	has_many :price_histories, dependent: :destroy
	has_many :scans
	has_and_belongs_to_many :patterns
	has_many :opportunities
	has_many :trades, through: :opportunities
	
end