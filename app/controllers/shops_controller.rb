class ShopsController < ApplicationController

	def index
		@shop = Shop.all

		respond_to do |format|
			format.html
			format.json {render json: @shop}
		end
	end
	def show
		@shop = Shop.find(params[:id])
	end

	def favorite
	user = User.find(session[:user_id])
	shop = Shop.find(params[:id])
	if user.favorite(shop)
		redirect_to shop_path(shop)
	end
end

def unfavorite
	user = User.find(session[:user_id])
	if user.destroy(shop)
		redirect_to user_path(user)
	end
end
end