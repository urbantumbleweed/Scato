FactoryGirl.define do
	factory :admin, class: User do
		name: "Stephen Saunders", 
		username: "ss",
		email: "ss@ga.co",
		password: 12345,
		password: 12345,
		balance: 1000000,
		max_position_percent: 8.0,
		max_risk_percent_per_position: 0.5,
		admin: true,
		manager:false
	end

	
end