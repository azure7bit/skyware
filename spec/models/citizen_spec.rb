require 'spec_helper'

describe Citizen do
	it "should be a valid citizen object" do
		user = build(:citizen)
		expect(user).to be_valid
	end
end
