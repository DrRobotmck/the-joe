FactoryGirl.define do
	factory :user do
		name {Faker::Name.name}
		email {Faker::Internet.email}
		password_digest 'poop'
	end
end