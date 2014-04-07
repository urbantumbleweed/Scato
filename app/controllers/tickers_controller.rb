class TickersController < ApplicationController
	
	def index
		render json: Ticker.all
		
	end

end