class Opportunity < ActiveRecord::Base
	belongs_to :ticker
	has_many :trades
	has_many :users, through: :usertunities

	validates :risk, :expected_reward, :ticker_id, :scan_id, presence: true

	def ticker
		Ticker.find(self.ticker_id)
	end

	def parent_scan
		Scan.find(self.scan_id)		
	end

	#needs to have an option for short sales with an if statement.
	def entry_price
		self.ticker.dayHigh + 0.02
	end

	def current_price
		self.ticker.ask
	end

	#needs to be modified if a short sale with an if statment
	def target_price
		return self.ticker.bid + self.expected_reward
	end

	def position_size(user_obj)
		max_cap = user_obj.capital_allowed_per_position
		max_risk = user_obj.capital_allowed_per_position_as_risk
		opt1 = max_cap / self.ticker.ask
		opt2 = max_risk / self.risk
		return opt1 > opt2 ? opt2.to_i : opt1.to_i
	end
end