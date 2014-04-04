require 'spec_helper'

describe User do

	describe "" do
		before do
			@user = User.create(name: "Stephen Saunders", 
													username: "ss",
													email: "ss@ga.co",
													password: 12345,
													password: 12345,
													balance: 1000000,
													max_position_percent: 8.0,
													max_risk_percent_per_position: 0.5,
													admin: true,
													manager:false)
			@user1 = User.create(name: "Manager Mike", 
													username: "mike",
													email: "ss@ga.com",
													password: 12345,
													password: 12345,
													balance: 1000000,
													max_position_percent: 8.0,
													max_risk_percent_per_position: 0.5,
													admin: false,
													manager:true)
			@ticker = Ticker.create()
		end
	end
	
end