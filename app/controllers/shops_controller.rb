class ShopsController < ApplicationController

	def index
		@shop = Shop.all

		respond_to do |format|
			format.html
			format.json {render json: @shop}
		end
	end
end