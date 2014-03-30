class Scan < ActiveRecord::Base
	has_and_belongs_to_many :investors
	has_many :opportunities

	validates :symbol, :security_type, presence: true
end