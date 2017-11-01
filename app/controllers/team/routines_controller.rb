class Team::RoutinesController < ApplicationController
	layout 'layouts/_team_partial'
  def index
  	@routines = Routine.all
  end
end
