class Ticker < ActiveRecord::Base
	has_many :price_histories
	has_many :scans
	has_and_belongs_to_many :patterns
	has_many :opportunities
	has_many :usertunities, through: :opportunities

	


	# #requests the standard quote from Yahoo through YahooFinanceWrapper
	# def retrieve_standard_quote
	# 	return YahooFinanceWrapper.get_standard_quotes(self.ticker)
	# end
	
	# #requests the extended quote from Yahoo through YahooFinanceWrapper
	# def retrieve_extended_quote
	# 	return YahooFinanceWrapper.get_extended_quotes(self.ticker)
	# end

	# #requests standard quotes for an array of ticker symbols from Yahoo through YahooFinanceWrapper	
	# def self.retrieve_many_standard_quotes(tickers_array)
	# 	return YahooFinanceWrapper.get_standard_quotes(tickers_array)
	# end

	# #requests extended quotes for an array of ticker symbols from Yahoo through YahooFinanceWrapper	
	# def self.retrieve_many_extended_quotes(tickers_array)
	# 	return YahooFinanceWrapper.get_extended_quotes(tickers_array)
	# end

	# #sets the values that use the standard quote
	# def update_standard_fields(std_quote)
	# 	self.update(name: std_quote[self.ticker].name,
	# 							date: std_quote[self.ticker].date,
	# 							ask: std_quote[self.ticker].ask,
	# 							bid: std_quote[self.ticker].bid,
	# 							volume: std_quote[self.ticker].volume,
	# 							previousClose: std_quote[self.ticker].previousClose,
	# 							open: std_quote[self.ticker].open,
	# 							dayHigh: std_quote[self.ticker].dayHigh,
	# 							dayLow: std_quote[self.ticker].dayLow,
	# 							lastTrade: std_quote[self.ticker].lastTrade,
	# 							changePoints: std_quote[self.ticker].changePoints,
	# 							changePercent: std_quote[self.ticker].changePercent)
	# end

	# #sets the values that use the extended quote
	# def update_extended_fields(ext_quote)
	# 	self.update(#exchange: ext_quote[self.ticker].stockExchange,
	# 							peRatio: ext_quote[self.ticker].peRatio,
	# 							pegRatio: ext_quote[self.ticker].pegRatio,
	# 							weeks52ChangeFromHigh: ext_quote[self.ticker].weeks52ChangeFromHigh,
	# 							weeks52ChangePercentFromHigh: ext_quote[self.ticker].weeks52ChangePercentFromHigh,
	# 							weeks52ChangeFromLow: ext_quote[self.ticker].weeks52ChangeFromLow,
	# 							weeks52ChangePercentFromLow: ext_quote[self.ticker].weeks52ChangePercentFromLow)
	# 	self.update(weeks52High: self.bid - self.weeks52ChangeFromHigh,
	# 							weeks52Low: self.bid - self.weeks52ChangeFromLow)
	# end

	# #returns the ticker object with updated standard info if updated
	# #otherwise returns nil
	# def refresh_standard_quote
	# 	quote = self.retrieve_standard_quote
	# 	if self.update_standard_fields(quote)
	# 		return self
	# 	else 
	# 		return nil
	# 	end
	# end

	# #returns the ticker object with updated extended info if updated
	# #otherwise returns nil
	# def refresh_extended_quote
	# 	quote = self.retrieve_extended_quote
	# 	if self.update_extended_fields(quote)
	# 		return self
	# 	else
	# 		return nil
	# 	end
	# end

	# #returns the ticker object with updated standard and extended info if updated
	# #otherwise returns nil
	# def refresh
	# 	if self.refresh_standard_quote && self.refresh_extended_quote
	# 	 return self
	# 	else
	# 		return nil
	# 	end
	# end

	# #returns an array of all the ticker symbols
	# def self.get_all_tickers
	# 	self.all.map {|tick|
	# 		tick.ticker
	# 	}
	# end

	# def self.get_many_tickers(tickers_query_array)
	# 	self.tickers_query_array.map {|tick|
	# 		tick.ticker
	# 	}
	# end

	# #takes an array of ticker symbols and returns an array of arrays of of tickers.
	# #YahooFinance will not process more than 200 tickers at once.
	# #Each array will contain up to 200 ticker symbols for batch processing.


	# #refrehses the standard information for each ticker in the array
	# def self.refresh_many_standard_quotes(many_tickers)
	# 	standard_quotes = self.retrieve_many_standard_quotes(many_tickers)
	# 	self.all.each {|tick|
	# 		tick.update_standard_fields(standard_quotes)
	# 	}
	# end

	# #refreshes all the extended information for each ticker in the array
	# def self.refresh_many_extended_quotes(many_tickers)
	# 	extended_quotes = self.retrieve_many_extended_quotes(many_tickers)
	# 	self.all.each do |tick|
	# 		tick.update_extended_fields(extended_quotes)
	# 	end
	# end

	# #Method needs to be tested now.
	# #The smaller arrays can be send to request data from Yahoo.
	# #refreshes each ticker by sending one array
	# def self.refresh_all
	# 	tickers_array = self.get_all_tickers
	# 	#each array in the tickers_array is a block of tickers
	# 		tickers_array.each do |ticker_block|
	# 			YahooFinanceWrapper::YAHOO_SLEEP
	# 			self.refresh_many_standard_quotes(ticker_block)
	# 			YahooFinanceWrapper::YAHOO_SLEEP
	# 			self.refresh_many_extended_quotes(ticker_block)
	# 		end
	# end

	# def self.refresh_many(tickers_array)
	# 	#each array in the tickers_array is a block of tickers
	# 		tickers_array.each do |ticker_block|
	# 			YahooFinanceWrapper::YAHOO_SLEEP
	# 			self.refresh_many_standard_quotes(ticker_block)
	# 			YahooFinanceWrapper::YAHOO_SLEEP
	# 			self.refresh_many_extended_quotes(ticker_block)
	# 		end
	# end

	# #takes the current price details and stores them in the tickers PriceHistory.
	# #returns price history object.
	# def save_price_history
	# 	day = PriceHistory.new(ticker_id: self.id,
	# 										date: self.date, 
	# 										open: self.open,
	# 										high: self.dayHigh,
	# 										low: self.dayLow,
	# 										close: self.lastTrade,
	# 										day_range: (self.dayHigh - self.dayLow).abs,
	# 										open_close: (self.close - self.open).abs,
	# 										open_low: self.open - self.dayLow,
	# 										open_high: self.dayHigh - self.open,
	# 										close_low: self.lastTrade - self.dayLow,
	# 										close_high: self.dayHigh - self.lastTrade,
	# 										volume: self.volume)
	# 		day[:priceUp] = false unless day.open > day.close
	# 		day[:priceDown] = false unless day.close > day.open
	# 		day.save
	#     return day
	# end

	# #returns the PriceHistory object for self's date. 
	# def get_day_stats(date = self.date)
	# 	PriceHistory.get_activity(self, date)
	# end

	# returns true if the price action for a PriceHistory forms a doji
	def doji?
		# day = self.get_day_stats
		# higher = day.higher_lower_of_open_close_range[:higher]
		# lower = day.higher_lower_of_open_close_range[:lower]
		# window_high = day.middle_window[:high]
		# window_high = day.middle_window[:low]

		# if (day.oc_hl_ratio > Pattern::DOJI_OPEN_CLOSE_TO_DAY_RANGE_RATIO &&
		# 		day.open_close < Pattern::DOJI_MIN_OPEN_CLOSE_SPREAD &&
		# 		higher <= window_high &&
		# 		lower >= window_low)
				# return true
		# else
				 # return false
		# end
	end

end