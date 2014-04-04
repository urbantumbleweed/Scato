class YahooFinanceWrapper

	# RubyDoc: http://rubydoc.info/gems/yahoofinance/1.2.2/frames
	# Homepage: www.transparentech.com/projects/yahoofinance

	#retrieves realtime quote information.
	#can enter multiple tickers, up to 200 in one request
	def self.get_standard_quotes(ticker_symbol)
		YahooFinance.get_standard_quotes(ticker_symbol)
	end

	#retrieves realtime additional company information
	#can enter multiple tickers 
	def self.get_extended_quotes(ticker_symbol)
		YahooFinance.get_extended_quotes(ticker_symbol)
	end



end