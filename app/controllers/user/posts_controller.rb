class User::PostsController < ApplicationController
	layout 'layouts/_user_partial'
  def index
  		@from_time = Time.now
  		@posts = Post.thisUserGroup(User.find(session[:user_id]))
  end
end
