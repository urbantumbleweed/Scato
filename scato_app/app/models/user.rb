class User < ActiveRecord::Base
	has_many :trades
	has_many :user_opportunities
	has_many :opportunities, through: :user_opportunities
	has_and_belongs_to_many :patterns

	has_secure_password
	validates :name, :email, :password, :password_confirmation, presence: true
	validates :username, uniqueness: { case_sensitive: false}
	validates :password, length: {minimum: 5}
	validates :balance, :max_position_percent, :max_risk_percent_per_position, numericality: { greater_than_or_equal_to: 0 }

	#returns an array symbols for the open trades of an user
	def open_trades
		return self.trades.where(trade_open: true)
		
	end

	#returns an array of the closed trades of an user
	def closed_trades
		return self.trades.where(trade_open: false)
	end

	#return an array of the trades that were profitable and closed
	def profitable_trades
			return self.trades.where(trade_open: false, profitable: true)
	end

	#return an array of the trades that lost money
	def losing_trades
		return self.trades.where(trades_open: false, profitable: false)
	end


	#returns wether the user is an admin
	# def is_admin?
		
	# end

	def capital_allowed_per_position
		return self.balance * (self.max_position_percent / 100)
	end

	def capital_allowed_per_position_as_risk
		return self.balance * (self.max_risk_percent_per_position / 100)
	end

	#return array of opportunity objects that belong to user
	# def opportunities
	# 	scans_ids = self.scans.map {|scan| scan.id}
	# 	return Opportunity.find(scan_ids)
		
	# end

	#returns an integer representing the number of shares appropriate for a given account balance. 
	def opportunity_position_size(opportunity)
			opportunity.position_size(self)
	end

	#returns an array of position sizes for the users opportunities
	def opportunity_position_sizes
		self.opportunities.map {|opp| opp.position_size(self)}
	end


end