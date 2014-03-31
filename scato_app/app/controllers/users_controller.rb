class UsersController < ApplicationController

	#this view does not require logging in
	def welcome
		
	end

	#view should be available only to admin, lists all investors in the system.
	def index
			@users = User.all
	end

	#page shows User their account. Admin can also see this view.
	def show
		@user = User.find(current_user.id)
		@user.open_trades.each {|trade| trade.current_price}
		@opportunities@User.opportunities
		
		#get current prices


	end

	#this is form to create a new User. Accessible whenever not logged in from any page.
	def new
		@user = User.new
		
	end

	#this is used to create the new record.  Accepts form for new User.
	def create
		@user = User.new()
		
	end

	# link to this is accessible from the User show page. Investors can edit their personal information
	def edit
		
	end

	#receives put/patch requests from from edit fields
	def update
		
	end

	#used to remove an User from the database. Trades and their results should not be deleted. Trades will simply no longer be linked to an User.
	def destroy
		
	end

end