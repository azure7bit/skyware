class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #

    alias_action :read, :new, :create, :edit, :update, :to => :modify

    user ||= User.new # guest user (not logged in)
    user ||= Citizen.new

    #not authorize for this user
    can :modify, CompanyDoc unless user.is_a?(User) || user.is_a?(Citizen)

    #only read
    can :read, CompanyDoc if user.is_a?(User)
    can :read, Location

    #Business user
    can :modify, User if user.is_a?(BusinessUser)
    can :modify, Location if user.is_a?(BusinessUser)

    # Superadmin
    can :modify, :all if user.is_a?(SuperAdmin)

    # staff
    can :modify, CompanyDoc if user.is_a?(Staff)

    # superadmin and business users
    can :modify, CompanyProfile if user.is_a?(BusinessUser) || user.is_a?(SuperAdmin)
  end
end
