class Employee < ActiveRecord::Base
  attr_accessible :business_id, :email, :name, :password, :password_confirmation

  belongs_to :business

  include Tire::Model::Search
  include Tire::Model::Callbacks
end
