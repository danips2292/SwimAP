class ApplicationController < ActionController::Base

  
  #protect_from_forgery with: :exception
  #before_action :authenticate_user!
  #before_filter :authenticate_user!
  #before_action :validate_access
 protect_from_forgery with: :exception
 
  private 
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please Login"
      redirect_to(:controller => 'access' , :action => "login")
      return false
    else
      return true      
    end
  end

end
