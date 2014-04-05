FactoryGirl.define do

	factory :ticker, class: Ticker do
		ticker: 'SDSS'
		name: 'Stephen Inc.'
		date: '2014-04-03'
		ask: 100.00
		bid: 99.99
		volume: 2500000
		previousClose: 95.00
		open: 96.00
		dayHigh: 110.00
		dayLow: 95.50
		lastTrade: 105.00
		changePoints: 9.00
		changePercent: 10.00
		exchange: 'test'
		peRatio: 32.00
		pegRatio: 0.90
		weeks52High: 120.00
		weeks52Low: 75.00
		weeks52ChangeFromHigh: 15.00
		weeks52ChangeFromLow: 30.00
		weeks52ChangePercentFromHigh: 16.66
		weeks52ChangePercentFromLow: 33.33
	end

	factory :doji, class: Ticker do
		ticker: 'DOJI'
		name: 'This is a doji'
		date: '2014-04-03'
		ask: 100.00
		bid: 99.99
		volume: 1500000
		previousClose: 95.00
		open: 95.00
		dayHigh: 100.00
		dayLow: 90
		lastTrade: 95.00
		changePoints: 9.00
		changePercent: 10.00
		exchange: 'test'
		peRatio: 32.00
		pegRatio: 0.90
		weeks52High: 120.00
		weeks52Low: 75.00
		weeks52ChangeFromHigh: 15.00
		weeks52ChangeFromLow: 30.00
		weeks52ChangePercentFromHigh: 16.66
		weeks52ChangePercentFromLow: 33.33
	end

	factory :noji, class: Ticker do
		ticker: 'NOJI'
		name: 'not a doji'
		date: '2014-04-03'
		ask: 100.00
		bid: 99.99
		volume: 1500000
		previousClose: 95.00
		open: 90.00
		dayHigh: 110.00
		dayLow: 90
		lastTrade: 99.00
		changePoints: 9.00
		changePercent: 10.00
		exchange: 'test'
		peRatio: 32.00
		pegRatio: 0.90
		weeks52High: 120.00
		weeks52Low: 75.00
		weeks52ChangeFromHigh: 15.00
		weeks52ChangeFromLow: 30.00
		weeks52ChangePercentFromHigh: 16.66
		weeks52ChangePercentFromLow: 33.33
	end

end