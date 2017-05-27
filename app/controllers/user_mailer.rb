class UserMailer < ActionMailer::Base
    default :from => "me@mydomain.com"

 def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.nickname} <#{user.email}>", :subject => "Registration Confirmation")
 end
end