class BusinessUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  self.table_name = "business_users"
  self.inheritance_column = :user_type
  # Include default devise modules. Others available are:
  # :token_authenticatable, 
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         # :omniauthable, :omniauth_providers => [:google_oauth2]

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name, :first_name, :last_name, :user_type, :phone_number, :location, :image, :subdomain
  # attr_accessor :business_user

  validates :subdomain, format: { with: /\A[a-z][a-z0-9_-]{2,}\z/, message: 'include only alphanumeric, hyphen(-) or underscore(_)' }, allow_nil: true

  validates :username, uniqueness: true

  acts_as_messageable

  # has_one :business_user
  # has_many :locations

  # has_one :online_store

  # has_one :company_forum

  # has_one :company_profile

  # has_many :forum_posts, :as => :postable

  # has_many :employees, :through => :locations

  has_many :blog_posts, :as => "blogger", :class_name => "Blogit::Post"

  attr_accessor :avatar

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

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

  # before_save :generate_subdomain if :new_record?
  before_save :downcase_subdomain
  after_create :save_business_users, :send_mailer if :new_record?

  def send_mailer
    UserMailer.send_generate_password(self, self.password).deliver if self.user_type != "SuperAdmin"
  end

  def self.is_for_user(subdomain)
    where("user_type not in (?) and subdomain = ? ",'SuperAdmin',subdomain)
  end

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

  def generate_subdomain
    password = Devise.friendly_token.first(8)
    self.password = password
    self.username = "#{self.username}@#{self.subdomain}"
    self.user_type = self.class.to_s
  end

  def downcase_subdomain
    self.subdomain = self.subdomain.downcase
  end
  
  def save_business_users
    if self.is_a?(SuperAdmin)
      sticky_post = {:blogger_id => self.id, :blogger_type => self.class.to_s, :post_type => "Sticky", :title => "About", :body => self.about}
      blog = Blogit::Post.new(sticky_post)
      blog.save
    end
    self.confirm!
  end

  def save_locations(params)
    if params[:business_user][:locations]
      self.locations.build(params[:business_user][:locations]).save
    end
  end

  def has_blogposts
    Blogit::Post.where(:blogger_id => self.id)
  end

end


class BusinessUser::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:subdomain, :email, :password, :password_confirmation, :username, :first_name, :last_name, :business_type, :business_name, :website, :about, :avatar, :locations_attributes => [:name, :street, :city, :state, :zipcode, :country])
  end

  def account_update
    default_params.permit(:subdomain, :email, :password, :password_confirmation, :current_password, :avatar, :facebook, :twitter, :linkedin, :flickr, :pinterest, :tumblr, :dropbox, :google_plus, :instagram, :github, :bitbucket, :vk, :locations_attributes => [:name, :street, :city, :state, :zipcode, :country])
  end
end

