class SuperAdmin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name, :first_name, :last_name, :user_type, :phone_number, :location, :image
  # attr_accessible :title, :body

  acts_as_messageable

  has_many :businesses

  has_one :online_store

  has_one :company_forum

  has_one :company_profile

  has_many :forum_posts, :as => :postable

  has_many :employees, :through => :business

  

  # include Tire::Model::Search
  # include Tire::Model::Callbacks


  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    super_admin = SuperAdmin.where(:email => data["email"]).first

    unless super_admin
        super_admin = SuperAdmin.create(name: data["name"],
	    		   email: data["email"],
	    		   password: Devise.friendly_token[0,20]
	    		  )
    end
    super_admin
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



end
