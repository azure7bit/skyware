require 'spec_helper'

describe SuperAdmin do
	it "should crete a valid SuperAdmin object" do
		user = build(:super_admin)
		expect(user).to be_valid
	end
	describe "naming methods" do
		let(:super_admin) { create(:super_admin, first_name: 'Sasi', last_name: 'Kumar') }
		describe "name" do
			it "should return full name of user" do
				expect(super_admin.name).to eq("Sasi Kumar")
			end
		end
		describe "name_with_initial" do
			it "should return full name of user" do
				expect(super_admin.name_with_initial).to eq("Sasi Kumar")
			end
		end
	end
end
