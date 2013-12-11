require_relative '../spec_helper'

	describe Shop do
		it {should validate_presence_of(:name)}
		it {should validate_presence_of(:address)}
		it {should validate_presence_of(:cross)}
		it {should validate_presence_of(:city)}
		it {should validate_presence_of(:neighborhood)}
		it {should validate_presence_of(:state)}
		it {should validate_presence_of(:zip)}
		it {should validate_presence_of(:phone)}
		it {should validate_presence_of(:snippet)}
		it {should validate_presence_of(:rating_url)}
		it {should validate_presence_of(:image)}
	end