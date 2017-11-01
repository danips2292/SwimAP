class Team::PostsController < ApplicationController
	layout 'layouts/_team_partial'
  def index
  	@from_time = Time.now
  	@posts = Post.team

  end
end
