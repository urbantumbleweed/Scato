class YahooFinanceWrapper

	# RubyDoc: http://rubydoc.info/gems/yahoofinance/1.2.2/frames
	# Homepage: www.transparentech.com/projects/yahoofinance

	YAHOO_SLEEP = 0.2
	YAHOO_BATCH_LIMIT = 200
	YAHOO_CALLS_PER_HOUR_LIMIT = 2000 #can be 20000 with api key
	YAHOO_CALLS_PER_DAY_LIMIT = 100000 #needs api key
	@@yahoo_api_calls_made_this_hour = 0
	@@time_first_call_of_hour = nil
	@@time_first_call_of_day = nil
	@@yahoo_api_calls_made_today =0

	# #retrieves realtime quote information.
	# #can enter multiple tickers, up to 200 in one request
	# def self.get_standard_quotes(ticker_symbol)
	# 	api_call_management
	# 	YahooFinance.get_standard_quotes(ticker_symbol)
	# end

	# #retrieves realtime additional company information
	# #can enter multiple tickers 
	# def self.get_extended_quotes(ticker_symbol)
	# 	api_call_management
	# 	YahooFinance.get_extended_quotes(ticker_symbol)
	# end

	# #retrieves historical data on a given ticker
	# def self.get_historical_quotes_days(ticker, days, &block)
	# 	api_call_management
	# 	YahooFinance.get_HistoricalQuotes_days(ticker, days, &block)
	# end

	# def self.get_historical_quotes_by_dates(ticker, startDate, endDate)
	# 	api_call_management
	# 	YahooFinance.get_HistoricalQuotes(ticker, startDate, endDate)
	# end

	# private
	# def self.api_call_management
	# 	#if there are no api calls made, set times and increment yahoo_api_calls_made by one

	# 	#if api_calls_made_this_hour equals the YAHOO_CALL_PER_HOUR_LIMIT and the current_time - time_of_first_call is < 1 hr, sleep until current_time - time_of_first_call is 1 hr.  Then reset the time_first_call_of_hour to nil and yahoo_api_calls_made_this_hour to 0.  If a current_time - time_first_call_of_day is < than 1 day then increment day counter regardless of resetting the hour counter.

	# 	#if the api_calls < than the limit, increment both hour and day counters by one

	# 	# if current_time - time of first call is > 1 hr, then set time of first call to nil

	# 	# if current_time - time_of_first_call_of_day is > 1 day, set the time_of_first_call_of_day to nil.
		
	# 	# if current_time - time_if_first_call_of_day is < 1 day and the api_call_made_this_hour = YAHOO_CALLS_PER_DAY_LIMIT the sleep until the time difference is 1 day.

	# end

end