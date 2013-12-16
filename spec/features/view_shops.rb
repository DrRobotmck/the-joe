require 'spec_helper'

describe Shop do 
	it "shows me a list of coffee shops" do
		visit "/shops"

		page.has_css? 'h2#name'
		page.has_css? "#phone"
		page.has_css? "h4#rating"
		page.has_css? "p#neighborhood"
		page.has_css? "p#zip"
	end
end