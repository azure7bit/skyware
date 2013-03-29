class Product < ActiveRecord::Base
  attr_accessible :name, :price, :super_admin_id


  include Tire::Model::Search
  include Tire::Model::Callbacks
end
