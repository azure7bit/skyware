class Product < ActiveRecord::Base
  attr_accessible :name, :price, :super_admin_id
end
