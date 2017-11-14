class UserMailer < ActionMailer::Base
  default from: "swimtecapp@gmail.com"
  
  def new_email(email, subject, body)
  	@content = body
  	@title = subject
    mail to: email, subject: subject
  end




end
