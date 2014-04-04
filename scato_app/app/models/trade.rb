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
		 tick = Ticker.find(self.ticker_id)
		 tick.refresh
		 tick.ask == 0.0 ? tick.bid : tick.ask

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

	def opportunity
		Opportunity.find(self.opportunity_id)
	end
						
						
end