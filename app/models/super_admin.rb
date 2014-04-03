class SuperAdmin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, 
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         # :omniauthable, :omniauth_providers => [:google_oauth2]

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name, :first_name, :last_name, :user_type, :phone_number, :location, :image, :subdomain
  # attr_accessor :business_user

  validates :subdomain, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z][a-z0-9_-]{2,}\z/, message: 'include only alphanumeric, hyphen(-) or underscore(_)' }, allow_nil: true

  acts_as_messageable

  has_many :locations

  has_one :online_store

  has_one :company_forum

  has_one :company_profile

  has_many :forum_posts, :as => :postable

  has_many :employees, :through => :locations

  has_many :users, :foreign_key => :owner_id

  attr_accessor :avatar

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  scope :for_business, where(:user_type => "Business")

  after_create :save_business_users

  # include Tire::Model::Search
  # include Tire::Model::Callbacks


 #  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
 #    data = access_token.info
 #    super_admin = SuperAdmin.where(:email => data["email"]).first

 #    unless super_admin
 #        super_admin = SuperAdmin.create(name: data["name"],
	#     		   email: data["email"],
	#     		   password: Devise.friendly_token[0,20]
	#     		  )
 #    end
 #    super_admin
	# end

  def name
    return "#{first_name} #{last_name}"
  end

  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    return self.email
    #if false
    #return nil
  end

  def name_with_initial
    "#{first_name} #{last_name}"
  end

  def save_business_users
    # subdomain = "#{self.business_user}.#{self.subdomain}"
    # business_users = self.business_user.split(",")

    # if business_users.is_a?(Array)
    #   business_users.each do |user|
    #     user_params = {:username => user, :subdomain => subdomain}
    #     self.users.build(user_params).save
    #   end
    # else
    #   user_params = {:username => self.business_user, :subdomain => subdomain}
    #   self.users.build(user).save
    # end
    sticky_post = {:blogger_id => self.id, :blogger_type => self.class.to_s, :post_type => "Sticky", :title => "About", :body => self.about}
    blog = Blogit::Post.new(sticky_post)
    blog.save
  end
end


class SuperAdmin::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:subdomain, :email, :password, :password_confirmation, :username, :user_type, :first_name, :last_name, :business_type, :business_name, :website, :about, :avatar)
  end

  def account_update
    default_params.permit(:subdomain, :email, :password, :password_confirmation, :current_password, :avatar, :facebook, :twitter, :linkedin, :flickr, :pinterest, :tumblr, :dropbox, :google_plus, :instagram, :github, :bitbucket, :vk)
  end
end