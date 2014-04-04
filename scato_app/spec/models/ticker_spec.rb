require 'spec_helper'


describe Ticker do

	describe do
		before do
			@ticker1 = Ticker.new(name: SDSS,
								date: '2014-04-03',
								ask: 100.00,
								bid: 99.99,
								volume: 2500000,
								previousClose: 95.00,
								open: 96.00,
								dayHigh: 110.00,
								dayLow: 95.50,
								lastTrade: 105.00,
								changePoints: 9.00,
								changePercent: 10.00,
								exchange: 'test',
								peRatio: 32.00,
								pegRatio: 0.90,
								weeks52High: 120.00,
								weeks52Low: 75.00,
								weeks52ChangeFromHigh: 15.00,
								weeks52ChangeFromLow: 30.00,
								weeks52ChangePercentFromHigh: 16.66,
								weeks52ChangePercentFromLow: 33.33)

			@doji = Ticker.new(name: DOJI,
								date: '2014-04-03',
								ask: 100.00,
								bid: 99.99,
								volume: 1500000,
								previousClose: 95.00,
								open: 95.00,
								dayHigh: 110.00,
								dayLow: 90,
								lastTrade: 95.00,
								changePoints: 9.00,
								changePercent: 10.00,
								exchange: 'test',
								peRatio: 32.00,
								pegRatio: 0.90,
								weeks52High: 120.00,
								weeks52Low: 75.00,
								weeks52ChangeFromHigh: 15.00,
								weeks52ChangeFromLow: 30.00,
								weeks52ChangePercentFromHigh: 16.66,
								weeks52ChangePercentFromLow: 33.33)

			@user1 = User.(name: "Stephen Saunders", 
										username: "ss",
										email: "ss@ga.co",
										password: 12345,
										password: 12345,
										balance: 1000000,
										max_position_percent: 8.0,
										max_risk_percent_per_position: 0.5,
										admin: true,
										manager:false)
		end

		describe ".refresh_all" do
			xit "should update each ticker with fresh info so that the current date is read from the database" do
			end
		end

		describe "#refresh" do
			xit "should return stock quote information with current date from database" do
		end

		describe "#add_to_price_history" do
			xit "should return true if the time on current date is after 4:00 PM EST" do
			end

			xit "should return true if the time on the next day is before 9:00 AM EST" do
			end

			xit "should equal lastTrade if time after 4:00 and before 9:00 AM next day." do
			end

			xit "it should return false if the time is between 9:00 AM and 4PM except" do
			end

			xit "should verify that only one entry per day and ticker exists" do
			end

			xit "should return false if another entry already exists" do
			end

			xit "should create PriceHistory obj with high,low, open, close and volume that match ticker" do
			end

			xit "should calculate the open_close in PriceHistory object" do
			end

			xit "should calculate the dayRange in PriceHistory object" do
			end

			xit	"should calculate the open_low in PriceHistory object" do
			end

			xit	"should calculate the open_high in PriceHistory object" do
			end

			xit	"should calculate the close_low in PriceHistory object" do
			end

			xit	"should calculate the close_high in PriceHistory object" do
			end

			xit	"should set the priceUp in PriceHistory object" do
			end

			xit	"should set the priceDown in PriceHistory object" do
			end
		end

		describe "#doji" do
			xit "should return true if the day's price data forms a doji"
			end

			xit "should return false if the difference between the open and close is greater than 0.03" do
			end

			xit "should return false if the ratio of dayRange to open_close is less than 8.0" do
			end

			xit "should return false if the open_close is not within the middle third of the dayRange" do
			end
		end


end