require 'spec_helper'

describe Shop do 
	before{5.times{FactoryGirl.create(:shop)}}
	it "shows me a list of coffee shops" do
		visit "/shops"
		within('ul.list')do
		page.assert_selector 'h4#name'
		page.assert_selector "h5#address"
		page.assert_selector "h6#rating"
		page.assert_selector "h6#neighborhood"
		page.assert_selector "h6#cross"
		page.assert_selector "h6#city"
		expect(page).to have_content "coffee", count: 5
	end
	end
end