class Investor < ActiveRecord::Base
	has_many :trades
	has_and_belongs_to_many :scans
	has_many :opportunities, through: :scans

	has_secure_password
	validates :name, :email, :password, :password_confirmation, presence: true
	validates :username, uniqueness: { case_sensitive: false}
	validates :password, length: {minimum: 5}
	validates :balance, :max_position_percent, :max_risk_percent_per_position, numericality: { greater_than_or_equal_to: 0 }

	#returns an array symbols for the open trades of an investor
	def open_trades
		return self.trades.where(trade_open: true)
		
	end

	#returns an array of the closed trades of an investor
	def closed_trades

	end

	#returns wether the investor is an admin
	# def is_admin?
		
	# end

	def capital_allowed_per_position
		return self.balance * (self.max_position_percent / 100)
	end

	def capital_allowed_per_position_as_risk
		return self.balance * (self.max_risk_percent_per_position / 100)
	end

	#return array of opportunity objects that belong to investor
	def opportunities
		scans_ids = self.scans.map {|scan| scan.id}
		return Opportunity.find(scan_ids)
		
	end

end