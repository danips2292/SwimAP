class UserMailer < ActionMailer::Base
  default from: "swimtecapp@gmail.com"
  
  def new_email(email, subject, body)
    mail to: email, subject: ""
  end




end
