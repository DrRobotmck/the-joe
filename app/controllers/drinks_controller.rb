class DrinksController < ApplicationController

	def index
		@drinks = Drink.all
	end
	def show
		@drink = Drink.find(params[:id])
		render json: @drink.definition
	end



end