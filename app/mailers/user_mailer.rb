class UserMailer < ActionMailer::Base
  default from: "swimtecapp@gmail.com"
  
  def new_post(email)
    mail to: email, subject: "[SWIMTEC] Hay una nueva noticia en el foro."  
  end
end
