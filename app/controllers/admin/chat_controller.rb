class Admin::ChatController < ApplicationController
	layout 'layouts/_admin_partial'
  def index
  	@users = User.accepted
  	@current_user = session[:user_id]
  end
end
