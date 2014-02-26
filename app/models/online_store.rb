class OnlineStore < ActiveRecord::Base
  # attr_accessible :super_admin_id, :name

  belongs_to :super_admin

  has_many :products
end
