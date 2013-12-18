require 'spec_helper'

describe User do
	before{2.times {FactoryGirl.create(:user)}}
	it{should validate_presence_of(:name)}
	it{should validate_presence_of(:email)}

	it{should validate_uniqueness_of(:email)}
end

describe "#favorite" do
	let(:user){FactoryGirl.create(:user)}
	let(:shop){FactoryGirl.create(:shop)}

	it "allows a user to save a coffee shop to their favorites list" do
		user.favorite(shop)
		expect(user.shops.count).to eq(1)
	end
end

describe "unfavorite" do
	let(:user){FactoryGirl.create(:user)}
	let(:shop){FactoryGirl.create(:shop)}

	before{user.favorite(shop)}

	it "allows a user to unfavorite a coffee shop" do
		user.unfavorite(shop)
		expect(user.shops.count).to eq(0)
	end
end

