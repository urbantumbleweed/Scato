class Symbol < ActiveRecord::Base


	def current_price
		 quote = YahooFinance.get_realtime_quotes(self)
		 return quote[self].bid
	end

end