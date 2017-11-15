class Team::RankingController < ApplicationController
	layout 'layouts/_team_partial'
before_action :confirm_logged_in
  before_action :validates_team_access
  
	
  def index
    @rankings = RankingLine.all
    distance = params[:distance]
    style = params[:style]
    if params[:distance] || params[:style]
        @rankings = RankingLine.search(distance,style).order("time ASC")
    else
        @rankings = RankingLine.all.order('time ASC')
    end
  end  

  def show
    @ranking = RankingLine.find(params[:id])
  end
end
