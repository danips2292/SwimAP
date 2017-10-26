class UserMailer < ActionMailer::Base
  default from: "swimtecapp@gmail.com"
  
  def new_post(users)
    @users = users
    @users.each do |user|
      mail to: user.email, subject: "Sign Up Confirmation"
    end  
  end
end
