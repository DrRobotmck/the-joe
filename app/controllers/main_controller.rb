class MainController < ApplicationController

	def index
		@drinks = Drink.all
		@shops = Shop.all
	end
	def show

	end

end