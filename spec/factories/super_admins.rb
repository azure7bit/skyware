# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :super_admin do
  	sequence(:email) { |n| "sasi#{n}@sasi.com" }
  	password 'password'
  end
end
