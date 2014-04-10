class UserMailer < ActionMailer::Base
  default from: 'noreply@skyhq.com'
 
  def send_generate_password(manager, pass)
    @manager = manager
    @password  = pass
    mail(to: @manager.email, subject: 'New Password')
  end
end
