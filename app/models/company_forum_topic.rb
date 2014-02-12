class CompanyForumTopic < ActiveRecord::Base
  attr_accessible :company_forum_id, :topic_title, :user_type, :topic_creator_id

  belongs_to :company_forum, dependent: :destroy

  has_many :forum_posts
  # include Tire::Model::Search
  # include Tire::Model::Callbacks
end
