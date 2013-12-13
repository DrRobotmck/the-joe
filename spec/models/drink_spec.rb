require 'spec_helper'

describe Drink do
	it{should validate_presence_of(:name)}
	it{should validate_presence_of(:definition)}
end