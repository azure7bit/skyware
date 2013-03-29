class BusinessMessenger < ActiveRecord::Base
  attr_accessible :body, :email, :super_admin_id
end
