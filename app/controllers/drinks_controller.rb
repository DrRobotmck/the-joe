class DrinksController < ApplicationController

	def index
		@drinks = Drink.all
		respond_to do |format|
    format.html
    format.json {render json: @drinks}
  end
	end
	def show
		@drink = Drink.find(params[:id])
		render json: @drink.definition
	end



end