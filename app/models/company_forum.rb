class CompanyForum < ActiveRecord::Base
  attr_accessible :super_admin_id, :title

  belongs_to :super_admin

  has_many :company_forum_topics
  # include Tire::Model::Search
  # include Tire::Model::Callbacks
end
