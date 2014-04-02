class Trade < ActiveRecord::Base
	belongs_to :user
	belongs_to :opportunities
	has_one :ticker, through: :opportunities
	validates :ticker_id, presence: true
	# validates :entry_order_type, presence: true
	validates :entry_price,  numericality: { greater_than: 0}
	validates :entry_quantity, numericality: { integer_only: true}
	validates :user_id, presence: true, numericality: { integer_only: true}
	# validates :opportunity_id, presence: true, numericality: { integer_only: true}
						
	def current_price
		# quote = YahooFinance.get_realtime_quotes(self.primary_ticker)
		# self.current_price = quote[self.primary_ticker].bid
	end	

	def ticker
		Ticker.find(self.ticker_id)
	end

	def risk
		return self.opportunity.risk * self.entry_quantity
	end

	def target
		return self.opportunity.expected_reward + self.entry_price
	end

	def expected_return
		return self.opportunity.expected_reward * self.entry_quantity
	end
						
						
end