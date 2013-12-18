require 'spec_helper'
describe "User has logged in" do
	user = FactoryGirl.create(:user)
	it "presents the user page with options" do
		visit new_user_path

		fill_in('Email -', with: user.email)
		fill_in('Enter password', with: 'poop' )
		click_button("Login")

		expect(page).to have_content 'Welcome!'
		expect(page).to have_content "#{user.name}"
		expect(page).to have_content "#{user.email}"
		page.has_css? "button.editaccount", text: "Edit Account"
	end
	it "allows you to edit your account" do
		visit new_user_path

		fill_in('Email -', with: user.email)
		fill_in('Enter password', with: 'poop' )
		click_button("Login")

		click_button("Edit Account")

		page.assert_selector 'h2.editTitle', text: 'Edit your account information'
	end
end