class SessionsController < ApplicationController

	#renders a login page
	def new
	end

	def create
		@investor = Investor.find_by(username: params[:username])
		if @investor.authenticate(params[:pass])
			session[:user_id] = @investor.id
			redirect_to @investor
		else
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end



end