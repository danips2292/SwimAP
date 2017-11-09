class Team::PostsController < ApplicationController
	layout 'layouts/_team_partial'
	before_action :confirm_logged_in
  before_action :validates_team_access
  def index
  	@from_time = Time.now
  	@posts = Post.team

  end
end
