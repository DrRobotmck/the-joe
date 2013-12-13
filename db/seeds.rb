# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Shop.destroy_all
Drink.destroy_all

file = File.new("/Users/macadocious/Downloads/allshops-complete.txt", "r")
drinks = File.new("/Users/macadocious/Desktop/drinks.txt", "r")

for shops in file do 
	oneShop = shops.split(",")
	seed_rest = Shop.create(name: oneShop[0], rating: oneShop[1], image: oneShop[2], phone: oneShop[3], rating_url: oneShop[4], snippet: oneShop[5], address: oneShop[6], cross: oneShop[7], neighborhood: oneShop[8], city: oneShop[9], state: oneShop[10], zip: oneShop[11])
end
for drink in drinks do
	aDrink = drink.split("|")
	Drink.create(name: aDrink[0], definition: aDrink[1])
end

