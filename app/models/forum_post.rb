class ForumPost < ActiveRecord::Base
  # attr_accessible :company_forum_topic_id, :post_body, :postable_type, :postable_id

  belongs_to :company_forum_topic, dependent: :destroy
  
  # include Tire::Model::Search
  # include Tire::Model::Callbacks
end
