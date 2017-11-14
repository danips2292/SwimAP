class UserMailer < ActionMailer::Base
  default from: "swimtecapp@gmail.com"
  
  def new_email(email, subject, body)
  	@content = body
    mail to: email, subject: subject
  end




end
