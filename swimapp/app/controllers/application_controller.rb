class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :authenticate_user!
  #before_action :validate_access
 
  def is_admin?
    signed_in? ? current_user.admin : false
  end

end
