class BusinessUser < User

  has_many :locations

  has_one :online_store

  has_one :company_forum

  has_one :company_profile

  has_many :forum_posts, :as => :postable

  has_many :employees, :through => :locations

  # scope :for_business, where(:user_type => "Business")

  # accepts_nested_attributes_for :locations

  after_create :save_business_users

  def save_business_users
    sticky_post = {:blogger_id => self.id, :blogger_type => self.class.to_s, :post_type => "Sticky", :title => "About", :body => self.about}
    blog = Blogit::Post.new(sticky_post)
    blog.save
  end

  def save_locations(params)
    if params[:business_user][:locations]
      self.locations.build(params[:business_user][:locations]).save
    end
  end
end