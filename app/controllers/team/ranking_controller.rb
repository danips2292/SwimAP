class Team::RankingController < ApplicationController
	layout 'layouts/_team_partial'

	
  def index
    @rankings = RankingLine.all
    distance = params[:distance]
    style = params[:style]
    if params[:distance] || params[:style]
        @rankings = RankingLine.search(distance,style).order("time DESC")
    else
        @rankings = RankingLine.all.order('time DESC')
    end
  end  

  def show
    @ranking = RankingLine.find(params[:id])
  end
end
