class Opportunity < ActiveRecord::Base
	belongs_to :scan
	has_many :trades

	validates :risk, :expected_reward, :scan_id, presence: true
end