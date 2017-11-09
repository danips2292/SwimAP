class User::PostsController < ApplicationController
	layout 'layouts/_user_partial'
	before_action :confirm_logged_in
  before_action :validates_user_access
  def index
  		@from_time = Time.now
  		@posts = Post.thisUserGroup(User.find(session[:user_id]))
  end
end
