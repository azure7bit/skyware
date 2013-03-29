class Business < ActiveRecord::Base
  attr_accessible :latitude, :location, :longitude, :name, :super_admin_id

  belongs_to :super_admin
  has_many :managers
  has_many :employees
end
