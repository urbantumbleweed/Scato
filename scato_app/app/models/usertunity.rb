class Usertunity < ActiveRecord::Base
	belongs_to :user
	belongs_to :opportunity

	def ticker
		self.opportunity.ticker		
	end

	def current_price
		self.ticker.ask
	end

	def entry_price
		self.ticker.dayHigh + 0.02
	end

	def risk
		self.opportunity.risk
	end

	def target_price
		self.opportunity.target_price
	end

	def risk_reward_ratio
		self.opportunity.expected_reward_ratio
	end

end