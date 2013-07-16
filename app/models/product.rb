class Product < ActiveRecord::Base
  attr_accessible :name, :price, :super_admin_id, :online_store_id


  # include Tire::Model::Search
  # include Tire::Model::Callbacks
end
