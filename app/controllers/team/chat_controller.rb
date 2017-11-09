class Team::ChatController < ApplicationController
	layout 'layouts/_team_partial'
	before_action :confirm_logged_in
  before_action :validates_team_access
  def index
  end
end
