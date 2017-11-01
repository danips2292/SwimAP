class Admin::RankingsController < ApplicationController
  layout 'layouts/_admin_partial'
  before_action :set_ranking, only: [:show]
  
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

  