class Opportunity < ActiveRecord::Base
	belongs_to :ticker
	has_many :trades
	has_and_belongs_to_many :users

	validates :risk, :expected_reward, :ticker_id, :scan_id, presence: true
end