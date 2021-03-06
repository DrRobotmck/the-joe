
require 'spec_helper'
describe "a user makes an account" do 

	it "goes to the account create page" do
		visit new_user_path

		fill_in('Name', with: "Ape")
		fill_in('Email', with: "a@p.e")
		fill_in('Password', with: "a")
		fill_in('Password confirmation', with: "a")

		click_button("Submit")

		expect(page).to have_content 'Welcome!'
		page.has_css? "h4.name", text: "Ape"
		page.has_css? "button.editaccount", count: 1
	end
end

describe "sign in" do
	a = FactoryGirl.create(:user)
	it "has an account" do
		visit new_user_path

		fill_in('Email -', with: a.email)
		fill_in('Enter password', with: "poop")

		click_button("Login")
		expect(page).to have_content "#{a.name}", count: 1
		page.has_css? "button.editaccount", count: 1
	end
	it "has no account" do
		visit new_user_path

		fill_in('Email -', with: "b@p.e")
		fill_in('Enter password', with: "b")

		click_button("Login")

		expect(page).to have_content 'Account'
	end
end