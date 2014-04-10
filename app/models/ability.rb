class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #

    alias_action :read, :new, :create, :edit, :update, :to => :modify

    user ||= BusinessUser.new # guest user (not logged in)
    user ||= Citizen.new

    #only read
    can :read, CompanyDoc if user.is_a?(BusinessUser)
    can :read, Location

    #SuperAdmin
    can :modify, BusinessUser if user.is_a?(SuperAdmin)
    can :modify, Location if user.is_a?(SuperAdmin)

    # staff
    can :modify, CompanyDoc if user.is_a?(Staff)

    # superadmin and business users
    can :modify, CompanyProfile if user.is_a?(SuperAdmin)
  end
end
