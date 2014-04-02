class PricehistoriesController < ApplicationController


	def index
		render json: PriceHistory.all
		
	end
end