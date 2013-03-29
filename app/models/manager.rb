class Manager < ActiveRecord::Base
  attr_accessible :business_id, :email, :name, :password, :password_confirmation

  belongs_to :business
end
