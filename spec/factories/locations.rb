# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :location do
		country 'India'
		association :super_admin
	end
end
