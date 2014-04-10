class Manager < BusinessUser
  # validates_presence_of :email, :password_confirmation, :password, :first_name, :last_name, :location_id, :title

  has_many :locations

  # acts_as_messageable
end