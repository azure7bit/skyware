module CompanyProfilesHelper
  def current_user_picture
  	@user = @user ? @user : current_user
    if current_business_user
      url = @user.avatar.blank? ? "business-avatar.png" : @user.avatar.url
    elsif current_user
      url = @user.avatar.blank? ? "img/profile-placeholder.png" : @user.avatar.url
    end
  end
end
