class SearchController < ApplicationController
	
	def index
		if params[:shopsearch]
			@shops = Shop.where("LOWER(name) SIMILAR TO '%'||?||'%' OR LOWER(neighborhood) SIMILAR TO '%'||?||'%' OR LOWER(city) SIMILAR TO '%'||?||'%' OR zip = ?", params[:shopsearch].downcase, params[:shopsearch].downcase, params[:shopsearch].downcase, params[:shopsearch].to_i)
			# binding.pry
		if @shops.empty?
			render :bad_search
		end
#individual drink search feature
		# elsif params[:drinksearch]
		# 	@drinks = Drink.where("LOWER(name) SIMILAR TO '%'||?||'%' OR LOWER(definition) SIMILAR TO '%'||?||'%'", params[:drinksearch].downcase, params[:drinksearch])
		end
	end
end