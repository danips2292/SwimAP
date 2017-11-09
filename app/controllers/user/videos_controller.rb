class User::VideosController < ApplicationController
	layout 'layouts/_user_partial'
  def index
  	@videos = Video.where(user_id: session[:user_id])
  end
end
