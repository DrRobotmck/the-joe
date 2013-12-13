# require 'spec/helper'
describe "a user makes an account" do 

	it "goes to the account create page" do
		visit new_user_path

			page.should have_selector("form", text: "poop")
	end
end