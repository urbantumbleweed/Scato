class InvestorsController < ApplicationController

	#this view does not require logging in
	def welcome
		
	end

	#view should be available only to admin, lists all investors in the system.
	def index
			@investors = Investor.all
	end

	#page shows investor their account. Admin can also see this view.
	def show
		@investor = Investor.find(current_user.id)
		@investor.open_trades.each {|trade| trade.current_price}
		@opportunities@investor.opportunities
		
		#get current prices


	end

	#this is form to create a new investor. Accessible whenever not logged in from any page.
	def new
		@investor = Investor.new
		
	end

	#this is used to create the new record.  Accepts form for new investor.
	def create
		@investor = Investor.new()
		
	end

	# link to this is accessible from the investor show page. Investors can edit their personal information
	def edit
		
	end

	#receives put/patch requests from from edit fields
	def update
		
	end

	#used to remove an investor from the database. Trades and their results should not be deleted. Trades will simply no longer be linked to an investor.
	def destroy
		
	end

end