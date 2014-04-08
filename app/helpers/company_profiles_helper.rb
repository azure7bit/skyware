module CompanyProfilesHelper
  def current_user_picture
    if current_business_user
      url = current_user.avatar.blank? ? "business-avatar.png" : current_user.avatar.url
    else
      url = current_user.avatar.blank? ? "img/profile-placeholder.png" : current_user.avatar.url
    end
  end
end
