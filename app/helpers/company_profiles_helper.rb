module CompanyProfilesHelper
  def current_user_picture
  	@user = @user ? @user : current_user

  	picture = @user.is_a?(BusinessUser) ? "business-avatar.png" : "img/profile-placeholder.png"

    url = @user.avatar.blank? ? picture : @user.avatar.url
  end
end