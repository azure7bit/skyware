require 'spec_helper'

describe Citizen do
	it "should be a valid citizen object" do
		user = build(:citizen)
		expect(user).to be_valid
	end
	describe "validations" do
		it "should have unique subdomain values" do
			user1 = create(:citizen, subdomain: 'sasi')
			user2 = build(:citizen, subdomain: 'sasi')
			expect(user2.valid?).to be_false
			expect(user2).to have(1).errors_on(:subdomain)
		end
		it "subdomains can be empty" do
			user1 = build(:citizen, subdomain: nil)
			expect(user1.valid?).to be_true
		end
	end
	describe "find_first_by_auth_conditions" do
		it "should return object found by email" do
			user = create(:citizen, email: 'sasi@mughil.in')
			expect(Citizen.find_first_by_auth_conditions(email: 'sasi@mughil.in')).to eq(user)
		end
		it "should return object found by HQID" do
			user = create(:citizen, subdomain: 'sasi')
			expect(Citizen.find_first_by_auth_conditions(email: 'sasi')).to eq(user)
		end
		it "should not return nil for wrong email" do
			user = create(:citizen, email: 'sasi@mughil.in')
			expect(Citizen.find_first_by_auth_conditions(email: 'ram@mughil.in')).to be_nil
		end
		it "should return nil for empty email, should not return user with empty HQID" do
			user = create(:citizen, subdomain: nil)
			expect(Citizen.find_first_by_auth_conditions(email: '')).to be_nil
		end
	end
end
