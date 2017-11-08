class User::CommentsController < ApplicationController
	layout 'layouts/_user_partial'
  def index
  	  	@from_time = Time.now
  		@comments = Comment.thisUserGroup(User.find(session[:user_id]))
  end
end
