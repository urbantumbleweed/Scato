# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'json'


# raw_data = File.read('./db/json/nyse2.json')
# stocks = JSON.parse(raw_data)
# stocks.each { |stock|
# 	if stock["Symbol"] =~ /^[a-zA-Z]+$/
# 		new_tick = Ticker.new(:ticker => stock["Symbol"].strip,
# 													:name => stock["Name"],
# 													:sector => stock["Sector"],
# 													:industry => stock["Industry"],
# 													:exchange => stock["Exchange"])
# 		new_tick.save
# 	end
# }
# raw_data = File.read('./db/json/nasdaq2.json')
# stocks = JSON.parse(raw_data)
# stocks.each { |stock|
# 	if stock["Symbol"] =~ /^[a-zA-Z]+$/
# 		new_tick = Ticker.new(:ticker => stock["Symbol"].strip,
# 													:name => stock["Name"],
# 													:sector => stock["Sector"],
# 													:industry => stock["Industry"],
# 													:exchange => stock["Exchange"])
# 		new_tick.save
# 	end
# }
# raw_data = File.read('./db/json/amex2.json')
# stocks = JSON.parse(raw_data)
# stocks.each { |stock|
# 	if stock["Symbol"] =~ /^[a-zA-Z]+$/
# 		new_tick = Ticker.new(:ticker => stock["Symbol"].strip,
# 													:name => stock["Name"],
# 													:sector => stock["Sector"],
# 													:industry => stock["Industry"],
# 													:exchange => stock["Exchange"])
# 		new_tick.save
# end
# }

# raw_data = File.read('./db/json/pricehistories.json')
# pricehistories = JSON.parse(raw_data)
# pricehistories.each do |ps|
# 	PriceHistory.create(ps)

#  end

# i1 = User.create(name: "John Doe",
# 									email: "jd@ga.com",
# 									username: "jdman" ,
# 									password: 12345,
# 									password_confirmation: 12345,
# 									balance: 100000,
# 									max_position_percent: 10,
# 									max_risk_percent_per_position: 2)

# i2 = User.create(name: "Admin",
# 									email: "admin@ga.com",
# 									username: "admin" ,
# 									password: 12345,
# 									password_confirmation: 12345,
# 									balance: 0,
# 									max_position_percent: 0,
# 									max_risk_percent_per_position: 0,
# 									admin: true)

# i3 = User.create(name: "Manager Mike",
# 									email: "mm@ga.com",
# 									username: "mike" ,
# 									password: 12345,
# 									password_confirmation: 12345,
# 									balance: 1000000,
# 									max_position_percent: 1.0,
# 									max_risk_percent_per_position: 0.1,
# 									manager: true)

# p = Pattern.create(name: "Doji",
# 										pattern_type: "single candle",
# 										description: "The doji is a single candle pattern that occurs when the open and close are the same or nearly the same.  The range between the high and low should be at least 4.5 times greater than the absolute distance between the open and the close.",
# 										historical_target_reaching_strength: 70,
# 										historical_directional_reliability:  85,
# 										historical_rarity_ranking: 650)

# i1.patterns << p

i1 = User.find(1)

sc = Ticker.where("volume > ? AND bid > ?", 500000, 10)
pat = Pattern.find_by(name: "Doji")
sc.each do |tick|
	open_close = (tick.lastTrade - tick.open).abs
	high_low = (tick.dayHigh - tick.dayLow)

	if (high_low / open_close > 4.5) && (open_close < 0.03)
		rsk = high_low + 0.02
		exp_rwd = tick.dayHigh - tick.bid
		ratio = exp_rwd / rsk

		scan = Scan.create(ticker_id: tick.id, 
												entry_confirmation: true)
		Relevance.create(pattern_id: pat.id, 
																scan_id: scan.id, 
																pattern_relevance: 80)
		opp = Opportunity.create(strength: pat.historical_target_reaching_strength,
															risk: rsk,
															expected_reward: exp_rwd,
															priority: rand(50..85),
															expected_reward_ratio: ratio,
															scan_id: scan.id,
															pattern_id: 1,
															ticker_id: tick.id)
		i1.opportunities << opp
		p_size = opp.position_size(i1)
		risk_amount = p_size * opp.risk
		opp_reward = p_size * opp.expected_reward
		usertune = Usertunity.create(user_id: i1.id, 
																	opportunity_id: opp.id,
																	position_size: p_size,
																	risk_amount: risk_amount,
																	expected_opportunity_return: opp_reward)
	end

end

aapl = Ticker.find_by(ticker: "AAPL")
goog = Ticker.find_by(ticker: "GOOG")
ford = Ticker.find_by(ticker: "F")

arr = [aapl, goog, ford]

arr.each do |tick|
	open_close = (tick.lastTrade - tick.open).abs
	high_low = (tick.dayHigh - tick.dayLow)
	rsk = open_close + 0.02
	exp_rwd = tick.dayHigh - tick.bid
	ratio = exp_rwd / rsk

		scan = Scan.create(ticker_id: tick.id, 
												entry_confirmation: true)
		opp = Opportunity.create(risk: rsk,
															expected_reward: exp_rwd,
															priority: rand(50..85),
															expected_reward_ratio: ratio,
															scan_id: scan.id,
															ticker_id: tick.id)
		i1.opportunities << opp
		p_size = opp.position_size(i1)
		risk_amount = p_size * opp.risk
		opp_reward = p_size * opp.expected_reward
		usertune = Usertunity.create(user_id: i1.id, 
																	opportunity_id: opp.id,
																	position_size: p_size,
																	risk_amount: risk_amount,
																	expected_opportunity_return: opp_reward)

		t1 = Trade.create(entry_date: '2014-03-17',
									entry_price: tick.previousClose,
									entry_quantity: p_size,
									user_id: i1.id,
									opportunity_id: opp.id,
									scan_id: scan.id,
									ticker_id: tick.id,
									trade_open: true)

end





# s1 = Scan.create(symbol: "GOOG",
# 							security_type: "stock")
# o1 = Opportunity.create(strength: 100,
# 												risk: 4.50,
# 												expected_reward: 9.00,
# 												priority: 1,
# 												scan_id: s1.id)
# t1 = Trade.create(primary_symbol: Scan.find(Opportunity.find(o1.id).scan_id).symbol,
# 									entry_order_type: "Buy/Stop Limit",
# 									exit_order_type: "Sell/Trailing Stop",
# 									entry_date: '2014-03-12',
# 									exit_date: '2014-03-20',
# 									trade_open: false,
# 									entry_price: 465.00,
# 									entry_quantity: 100,
# 									exit_price: 475.00,
# 									exit_quantity: 100,
# 									investor_id: i1.id,
# 									opportunity_id: o1.id)

# s2 = Scan.create(symbol: "AAPL",
# 							security_type: "stock")
# o2 = Opportunity.create(strength: 100,
# 												risk: 3.00,
# 												expected_reward: 12.00,
# 												priority: 2,
# 												scan_id: s2.id)
# t2 = Trade.create(primary_symbol: o2.scan.symbol,
# 									entry_order_type: "Buy/Stop Limit",
# 									exit_order_type: "Sell/Trailing Stop",
# 									entry_date: '2014-03-12',
# 									exit_date: '2014-03-20',
# 									trade_open: false,
# 									entry_price: 105.00,
# 									entry_quantity: 100,
# 									exit_price: 95.00,
# 									exit_quantity: 100,
# 									investor_id: i1.id,
# 									opportunity_id: o2.id)

# s3 = Scan.create(symbol: "MSFT",
# 							security_type: "stock")
# o3 = Opportunity.create(strength: 100,
# 												risk: 4.50,
# 												expected_reward: 9.00,
# 												priority: 1,
# 												scan_id: s3.id)
# t3 = Trade.create(primary_symbol: o3.scan.symbol,
# 									entry_order_type: "Buy/Stop Limit",
# 									exit_order_type: "Sell/Trailing Stop",
# 									entry_date: '2014-03-12',
# 									exit_date: '2014-03-20',
# 									trade_open: false,
# 									entry_price: 465.00,
# 									entry_quantity: 100,
# 									exit_price: 475.00,
# 									exit_quantity: 100,
# 									investor_id: i1.id,
# 									opportunity_id: o3.id)

# s4 = Scan.create(symbol: "GOOG",
# 							security_type: "stock")
# o4 = Opportunity.create(strength: 100,
# 												risk: 2.21,
# 												expected_reward: 6.63,
# 												priority: 1,
# 												scan_id: s4.id)
# t4 = Trade.create(primary_symbol: o4.scan.symbol,
# 									entry_order_type: "Buy/Stop Limit",
# 									exit_order_type: "Sell/Trailing Stop",
# 									entry_date: '2014-03-12',
# 									exit_date: '2014-03-20',
# 									trade_open: false,
# 									entry_price: 50.00,
# 									entry_quantity: 100,
# 									exit_price: 57.00,
# 									exit_quantity: 100,
# 									investor_id: i1.id,
# 									opportunity_id: o4.id)

# s5 = Scan.create(symbol: "T",
# 							security_type: "stock")
# o5 = Opportunity.create(strength: 100,
# 												risk: 4.50,
# 												expected_reward: 9.00,
# 												priority: 1,
# 												scan_id: s5.id)
# t5 = Trade.create(primary_symbol: o5.scan.symbol,
# 									entry_order_type: "Buy/Stop Limit",
# 									exit_order_type: "Sell/Trailing Stop",
# 									entry_date: '2014-03-12',
# 									exit_date: '2014-03-20',
# 									trade_open: false,
# 									entry_price: 465.00,
# 									entry_quantity: 100,
# 									exit_price: 475.00,
# 									exit_quantity: 100,
# 									investor_id: i1.id,
# 									opportunity_id: o5.id)
# s6 = Scan.create(symbol: "F",
# 							security_type: "stock")
# o6 = Opportunity.create(strength: 100,
# 												risk: 4.50,
# 												expected_reward: 9.00,
# 												priority: 1,
# 												scan_id: s6.id)
# t6 = Trade.create(primary_symbol: o6.scan.symbol,
# 									entry_order_type: "Buy/Stop Limit",
# 									exit_order_type: "Sell/Trailing Stop",
# 									entry_date: '2014-03-12',
# 									exit_date: '2014-03-20',
# 									trade_open: false,
# 									entry_price: 465.00,
# 									entry_quantity: 100,
# 									exit_price: 475.00,
# 									exit_quantity: 100,
# 									investor_id: i1.id,
# 									opportunity_id: o6.id)
