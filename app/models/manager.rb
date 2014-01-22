class Manager < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation, :title, :first_name, :last_name, :location_id

  validates_presence_of :email, :password_confirmation, :password, :first_name, :last_name, :location_id, :title

  belongs_to :location

  acts_as_messageable

  def name
  	self.first_name + " " + self.last_name
  end
end
