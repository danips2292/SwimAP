class UserController < ApplicationController
	layout '_content_partial'
  def index 

  end 


  def fillForm
  	if user_signed_in?
  		puts "is signed in"
  		puts current_user.email
  	end
  end


end
