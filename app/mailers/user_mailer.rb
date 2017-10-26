class UserMailer < ActionMailer::Base
  default from: "swimtecapp@gmail.com"
  
  def new_post(email)
    mail to: email, subject: "[SWIMTEC] Nueva noticia Agregada a su Grupo! "
  end
end
