class Ticker < ActiveRecord::Base
	has_many :price_histories, dependent: :destroy
	has_many :scans
	has_and_belongs_to_many :patterns
	has_many :opportunities
	has_many :trades, through: :opportunities
	

	def retrieve_standard_quote
		#requests the standard quote from Yahoo
		return YahooFinance.get_standard_quotes(self.ticker)
	end

	def retrieve_extended_quote
		#requests the extended quote from Yahoo
			return YahooFinance.get_extended_quotes(self.ticker)
	end

	def update_standard_fields(std_quote)
		#sets the values that use the standard quote
		self.update(#name: std_quote[self.ticker].name,
								date: std_quote[self.ticker].date,
								ask: std_quote[self.ticker].ask,
								bid: std_quote[self.ticker].bid,
								volume: std_quote[self.ticker].volume,
								previousClose: std_quote[self.ticker].previousClose,
								open: std_quote[self.ticker].open,
								dayHigh: std_quote[self.ticker].dayHigh,
								dayLow: std_quote[self.ticker].dayLow,
								lastTrade: std_quote[self.ticker].lastTrade,
								changePoints: std_quote[self.ticker].changePoints,
								changePercent: std_quote[self.ticker].changePercent)
	end

	def update_extended_fields(ext_quote)
		#sets the values that use the extended quote
		self.update(#exchange: ext_quote[self.ticker].stockExchange,
								peRatio: ext_quote[self.ticker].peRatio,
								pegRatio: ext_quote[self.ticker].pegRatio,
								weeks52ChangeFromHigh: ext_quote[self.ticker].weeks52ChangeFromHigh,
								weeks52ChangePercentFromHigh: ext_quote[self.ticker].weeks52ChangePercentFromHigh,
								weeks52ChangeFromLow: ext_quote[self.ticker].weeks52ChangeFromLow,
								weeks52ChangePercentFromLow: ext_quote[self.ticker].weeks52ChangePercentFromLow)
		self.update(weeks52High: self.bid - self.weeks52ChangeFromHigh,
								weeks52Low: self.bid - self.weeks52ChangeFromLow)
	end

	def refresh_standard_quote
		quote = self.retrieve_standard_quote
		if self.update_standard_fields(quote)
			return true
		end
	end

	def refresh_extended_quote
		quote = self.retrieve_extended_quote
		if self.update_extended_fields(quote)
			return true
		end
	end

	def refresh
		std_quote_complete = self.refresh_standard_quote
		ext_quote_complete = self.refresh_extended_quote
		return std_quote_complete && ext_quote_complete
	end

	def self.retrieve_all_standard_quotes(tickers_array)
		return YahooFinance.get_standard_quotes(tickers_array)
	end

	def self.retrieve_all_extended_quotes(tickers_array)
		return YahooFinance.get_extended_quotes(tickers_array)
	end

	def self.get_all_tickers
		self.all.map {|tick|
			tick.ticker
		}
	end


	#refrehses all the standard information for each ticker in the array
	def self.refresh_all_standard_quotes(all_tickers)
		standard_quotes = self.retrieve_all_standard_quotes(all_tickers)
		self.all.each {|tick|
			tick.update_standard_fields(standard_quotes)
		}
	end

	#refreshes all the extended information for each ticker
	def self.refresh_all_extended_quotes(all_tickers)
		extended_quotes = self.retrieve_all_extended_quotes(all_tickers)
		self.all.each {|tick|
			tick.update_extended_fields(extended_quotes)
		}
	end

	#refreshes each ticker by sending one array
	def self.refresh_all
		tickers_array = self.get_all_tickers.compact
		self.refresh_all_standard_quotes(tickers_array)
		self.refresh_all_extended_quotes(tickers_array)
	end
end