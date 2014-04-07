class SessionsController < ApplicationController

	#renders a login page
	def new
	end

	def create
		@user = User.find_by(username: params[:username])
		if @user.authenticate(params[:pass])
			session[:user_id] = @user.id
			redirect_to @user
		else
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end



end