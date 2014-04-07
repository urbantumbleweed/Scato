require 'spec_helper'

FactoryGirl.define do
	factory :user, class: User do
		name "Stephen Saunders"
		username "ss"
		email "ss@ga.co"
		password 12345
		password 12345
		balance 1000000
		max_position_percent 8.0
		max_risk_percent_per_position 0.5

	end

	factory :manager, class: User do
		name "Manager Mike" 
		username "mike"
		email "mike@ga.com"
		password 12345
		password 12345
		balance 1000000
		max_position_percent 8.0
		max_risk_percent_per_position 0.5
		manager true
	end

	factory :admin, class: User do
		name "Admin"
		username "admin"
		email "admin@ga.com"
		password 12345
		password 12345
		admin true
	end	

	#what was originally used to create factory objects
	# @ticker1 = Ticker.new(ticker: 'SDSS',
			#						name: "Stephen Inc."
			# 					date: '2014-04-03',
			# 					ask: 100.00,
			# 					bid: 99.99,
			# 					volume: 2500000,
			# 					previousClose: 95.00,
			# 					open: 96.00,
			# 					dayHigh: 110.00,
			# 					dayLow: 95.50,
			# 					lastTrade: 105.00,
			# 					changePoints: 9.00,
			# 					changePercent: 10.00,
			# 					exchange: 'test',
			# 					peRatio: 32.00,
			# 					pegRatio: 0.90,
			# 					weeks52High: 120.00,
			# 					weeks52Low: 75.00,
			# 					weeks52ChangeFromHigh: 15.00,
			# 					weeks52ChangeFromLow: 30.00,
			# 					weeks52ChangePercentFromHigh: 16.66,
			# 					weeks52ChangePercentFromLow: 33.33)

			# @doji = Ticker.new(ticker: 'DOJI',
			# 					name: 'this is a doji'
			# 					date: '2014-04-03',
			# 					ask: 100.00,
			# 					bid: 99.99,
			# 					volume: 1500000,
			# 					previousClose: 95.00,
			# 					open: 95.00,
			# 					dayHigh: 100.00,
			# 					dayLow: 90,
			# 					lastTrade: 95.00,
			# 					changePoints: 9.00,
			# 					changePercent: 10.00,
			# 					exchange: 'test',
			# 					peRatio: 32.00,
			# 					pegRatio: 0.90,
			# 					weeks52High: 120.00,
			# 					weeks52Low: 75.00,
			# 					weeks52ChangeFromHigh: 15.00,
			# 					weeks52ChangeFromLow: 30.00,
			# 					weeks52ChangePercentFromHigh: 16.66,
			# 					weeks52ChangePercentFromLow: 33.33)

			# @not_doji = Ticker.new(ticker: 'NOJI',
			# 					date: '2014-04-03',
			# 					ask: 100.00,
			# 					bid: 99.99,
			# 					volume: 1500000,
			# 					previousClose: 95.00,
			# 					open: 90.00,
			# 					dayHigh: 110.00,
			# 					dayLow: 90,
			# 					lastTrade: 99.00,
			# 					changePoints: 9.00,
			# 					changePercent: 10.00,
			# 					exchange: 'test',
			# 					peRatio: 32.00,
			# 					pegRatio: 0.90,
			# 					weeks52High: 120.00,
			# 					weeks52Low: 75.00,
			# 					weeks52ChangeFromHigh: 15.00,
			# 					weeks52ChangeFromLow: 30.00,
			# 					weeks52ChangePercentFromHigh: 16.66,
			# 					weeks52ChangePercentFromLow: 33.33)

			# @user1 = User.(name: "Stephen Saunders", 
			# 							username: "ss",
			# 							email: "ss@ga.co",
			# 							password: 12345,
			# 							password: 12345,
			# 							balance: 1000000,
			# 							max_position_percent: 8.0,
			# 							max_risk_percent_per_position: 0.5,
			# 							admin: true,
			# 							manager:false)

end