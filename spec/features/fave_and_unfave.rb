require 'spec_helper'
describe "#favorite" do
	shop = FactoryGirl.create(:shop)
	user = FactoryGirl.create(:user)

	it "favorites a coffee shop" do 
		visit new_user_path

		fill_in('Email -', with: user.email)
		fill_in('Enter password', with: 'poop' )
		click_button("Login")

		visit "/shops/#{shop.id}"

		click_button("Add to List")

		expect(user.shops.first).to eq(shop)
	end
end

describe "#unfavorite" do
	shop = FactoryGirl.create(:shop)
	user = FactoryGirl.create(:user)

	it "favorites a coffee shop" do 
		visit new_user_path

		fill_in('Email -', with: user.email)
		fill_in('Enter password', with: 'poop' )
		click_button("Login")

		visit "/shops/#{shop.id}"

		click_button("Add to List")

		expect(user.shops.first).to eq(shop)
	end
end