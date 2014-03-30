# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


i1 = Investor.create(name: "John Doe",
									email: "jd@ga.com",
									username: "jdman" ,
									password: 12345,
									password_confirmation: 12345,
									balance: 100000,
									max_position_percent: 10,
									max_risk_percent_per_position: 2)

s1 = Scan.create(symbol: "GOOG",
							security_type: "stock")
o1 = Opportunity.create(strength: 100,
												risk: 4.50,
												expected_reward: 9.00,
												priority: 1,
												scan_id: s1.id)
t1 = Trade.create(primary_symbol: Scan.find(Opportunity.find(o1.id).scan_id).symbol,
									entry_order_type: "Buy/Stop Limit",
									exit_order_type: "Sell/Trailing Stop",
									entry_date: '2014-03-12',
									exit_date: '2014-03-20',
									trade_open: false,
									entry_price: 465.00,
									entry_quantity: 100,
									exit_price: 475.00,
									exit_quantity: 100,
									investor_id: i1.id,
									opportunity_id: o1.id)

s2 = Scan.create(symbol: "AAPL",
							security_type: "stock")
o2 = Opportunity.create(strength: 100,
												risk: 3.00,
												expected_reward: 12.00,
												priority: 2,
												scan_id: s2.id)
t2 = Trade.create(primary_symbol: o2.scan.symbol,
									entry_order_type: "Buy/Stop Limit",
									exit_order_type: "Sell/Trailing Stop",
									entry_date: '2014-03-12',
									exit_date: '2014-03-20',
									trade_open: false,
									entry_price: 105.00,
									entry_quantity: 100,
									exit_price: 95.00,
									exit_quantity: 100,
									investor_id: i1.id,
									opportunity_id: o2.id)

s3 = Scan.create(symbol: "MSFT",
							security_type: "stock")
o3 = Opportunity.create(strength: 100,
												risk: 4.50,
												expected_reward: 9.00,
												priority: 1,
												scan_id: s3.id)
t3 = Trade.create(primary_symbol: o3.scan.symbol,
									entry_order_type: "Buy/Stop Limit",
									exit_order_type: "Sell/Trailing Stop",
									entry_date: '2014-03-12',
									exit_date: '2014-03-20',
									trade_open: false,
									entry_price: 465.00,
									entry_quantity: 100,
									exit_price: 475.00,
									exit_quantity: 100,
									investor_id: i1.id,
									opportunity_id: o3.id)

s4 = Scan.create(symbol: "GOOG",
							security_type: "stock")
o4 = Opportunity.create(strength: 100,
												risk: 2.21,
												expected_reward: 6.63,
												priority: 1,
												scan_id: s4.id)
t4 = Trade.create(primary_symbol: o4.scan.symbol,
									entry_order_type: "Buy/Stop Limit",
									exit_order_type: "Sell/Trailing Stop",
									entry_date: '2014-03-12',
									exit_date: '2014-03-20',
									trade_open: false,
									entry_price: 50.00,
									entry_quantity: 100,
									exit_price: 57.00,
									exit_quantity: 100,
									investor_id: i1.id,
									opportunity_id: o4.id)

s5 = Scan.create(symbol: "T",
							security_type: "stock")
o5 = Opportunity.create(strength: 100,
												risk: 4.50,
												expected_reward: 9.00,
												priority: 1,
												scan_id: s5.id)
t5 = Trade.create(primary_symbol: o5.scan.symbol,
									entry_order_type: "Buy/Stop Limit",
									exit_order_type: "Sell/Trailing Stop",
									entry_date: '2014-03-12',
									exit_date: '2014-03-20',
									trade_open: false,
									entry_price: 465.00,
									entry_quantity: 100,
									exit_price: 475.00,
									exit_quantity: 100,
									investor_id: i1.id,
									opportunity_id: o5.id)
s6 = Scan.create(symbol: "F",
							security_type: "stock")
o6 = Opportunity.create(strength: 100,
												risk: 4.50,
												expected_reward: 9.00,
												priority: 1,
												scan_id: s6.id)
t6 = Trade.create(primary_symbol: o6.scan.symbol,
									entry_order_type: "Buy/Stop Limit",
									exit_order_type: "Sell/Trailing Stop",
									entry_date: '2014-03-12',
									exit_date: '2014-03-20',
									trade_open: false,
									entry_price: 465.00,
									entry_quantity: 100,
									exit_price: 475.00,
									exit_quantity: 100,
									investor_id: i1.id,
									opportunity_id: o6.id)
