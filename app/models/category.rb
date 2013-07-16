class Category < ActiveRecord::Base
  attr_accessible :name, :product_id

  # include Tire::Model::Search
  # include Tire::Model::Callbacks
end
