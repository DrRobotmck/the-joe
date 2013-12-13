class MainController < ApplicationController

	def index
		@drinks = Drink.all
		@shops = Shop.all
	end

end