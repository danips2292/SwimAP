class Admin::VideosController < ApplicationController
	layout 'layouts/_admin_partial'

  def upload
  	@video = Video.new
  	client = DropboxApi::Client.new("bulRELf_jgAAAAAAAAAACN0I0-tJgLdc8QsH5Let93vT5CCbi6jRPQFW5VEjSFc5")
  	file_content = params[:file].tempfile
	client.upload "/"+params[:file].original_filename.to_s, file_content
	link = client.create_shared_link_with_settings("/"+params[:file].original_filename.to_s, {})
	@video.link =  link::url.to_s[0,link::url.to_s.size-1]+'1'
	@video.user_id = params[:user_id].to_i
	@video.comment = params[:comment]
	if @video.save
		redirect_to action: 'view', id: @video.id
	end

  end

  def view
  	@video = Video.find(params[:id])
  	puts @video.link


  end

  def index
  	client = DropboxApi::Client.new("bulRELf_jgAAAAAAAAAACN0I0-tJgLdc8QsH5Let93vT5CCbi6jRPQFW5VEjSFc5")
  	space = client.get_space_usage
  	@remaining = 100 - (space::used.to_f / space::allocation::allocated.to_f * 100.0).round(2)
    @groups = Group.all
  end

  def selectStudent
  	client = DropboxApi::Client.new("bulRELf_jgAAAAAAAAAACN0I0-tJgLdc8QsH5Let93vT5CCbi6jRPQFW5VEjSFc5")
  	space = client.get_space_usage
  	@remaining = 100 - (space::used.to_f / space::allocation::allocated.to_f * 100.0).round(2)
    @students = User.where(:group_id => params[:id])
  end 

  def newVideo
  	client = DropboxApi::Client.new("bulRELf_jgAAAAAAAAAACN0I0-tJgLdc8QsH5Let93vT5CCbi6jRPQFW5VEjSFc5")
  	space = client.get_space_usage
  	@remaining = 100 - (space::used.to_f / space::allocation::allocated.to_f * 100.0).round(2)
  end



end
