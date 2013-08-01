class Manager < ActiveRecord::Base
  attr_accessible :business_id, :email, :name, :password, :password_confirmation

  belongs_to :business

  has_many :forum_posts, :as => :postable

  # include Tire::Model::Search
  # include Tire::Model::Callbacks
end
