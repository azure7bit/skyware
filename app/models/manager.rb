class Manager < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation, :title, :first_name, :last_name, :business_id

  belongs_to :business

  def name
  	self.first_name "" + "" self.last_name
  end
end
