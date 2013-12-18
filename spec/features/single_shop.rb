require 'spec_helper'

describe "single coffee shop" do
	before{@shop = FactoryGirl.create(:shop)}
	it "shows a single coffee shops information" do
		visit shop_path(@shop)

		expect(page).to have_content "#{@shop.name}"
		page.has_css? 'h2.name', text: "#{@shop.name}", count: 1
		expect(page).to have_content "#{@shop.rating}" 
		page.has_css? 'h5.rating', text: "#{@shop.rating}", count: 1
		expect(page).to have_content "#{@shop.neighborhood}" 
		page.has_css? 'h5.neighborhood', text: "#{@shop.neighborhood}", count: 1
		expect(page).to have_content "#{@shop.address}" 
		page.has_css? 'h4.address', text: "#{@shop.address}", count: 1
		expect(page).to have_content "#{@shop.cross}"
		page.has_css? 'h5.cross', text: "#{@shop.cross}", count: 1
		expect(page).to have_content "#{@shop.city}"
		page.has_css? 'h5.city', text: "#{@shop.city}", count: 1
		expect(page).to have_content "#{@shop.zip}"
		page.has_css? 'h5.city', text: "#{@shop.zip}", count: 1
		expect(page).to have_content "#{@shop.phone}"
		page.has_css? 'h5.phone', text: "#{@shop.phone}", count: 1
		page.has_button? "button.favorite", count: 1, text: 'Add to List'
	end
end