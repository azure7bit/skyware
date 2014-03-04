class Citizen < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :subdomain, :title_tagline, :tagline
  # attr_accessible :title, :body
  
  attr_accessor :avatar

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/profile-placeholder.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :subdomain, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z][a-z0-9_-]{2,}\z/, message: 'include only alphanumeric, hyphen(-) or underscore(_)' }, allow_nil: true
  blogs
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    where(:email => data["email"]).first_or_create do |u|
    	password = Devise.friendly_token[0,20]
    end
  end

  def name
  	email
  end
end

class Citizen::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:subdomain, :email, :password, :password_confirmation)
  end

  def account_update
    default_params.permit(:subdomain, :email, :password, :password_confirmation, :current_password)
  end
end