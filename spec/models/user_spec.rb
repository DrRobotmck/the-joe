require 'spec_helper'

describe User do
	before{2.times {FactoryGirl.create(:user)}}
	it{should validate_presence_of(:name)}
	it{should validate_presence_of(:email)}

	it{should validate_uniqueness_of(:email)}
end