class SuperAdmin < BusinessUser

  has_many :locations, :foreign_key => "business_user_id"

  has_one :online_store, :foreign_key => "business_user_id"

  has_one :company_forum, :foreign_key => "business_user_id"

  has_one :company_profile, :foreign_key => "business_user_id"

  has_many :forum_posts, :as => :postable, :foreign_key => "business_user_id"

  has_many :employees, :through => :locations, :foreign_key => "business_user_id"

end