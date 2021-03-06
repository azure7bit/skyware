class Location < ActiveRecord::Base
  # attr_accessible :latitude, :location, :longitude, :name, :super_admin_id, :street, :city, :country, :state, :zipcode
  belongs_to :super_admin
  # belongs_to :business_user
  # has_many :employees


  # include Tire::Model::Search
  # include Tire::Model::Callbacks

  acts_as_gmappable

  def gmaps4rails_address
		#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
	  "#{self.street}, #{self.city}, #{self.country}" 
	end
end
