# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :citizen do
		sequence(:email) { |n| "email#{n}@email.com" }
		password "password"
		sequence(:subdomain) { |n| "sub#{n}" }
	end
end
