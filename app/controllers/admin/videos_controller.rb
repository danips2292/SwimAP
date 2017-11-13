class Admin::VideosController < ApplicationController
	layout 'layouts/_admin_partial'
   before_action :confirm_logged_in
  before_action :validates_admin_access
 

  def upload
    begin 
    	@video = Video.new
    	client = DropboxApi::Client.new("bulRELf_jgAAAAAAAAAACN0I0-tJgLdc8QsH5Let93vT5CCbi6jRPQFW5VEjSFc5")
    	file_content = params[:file].tempfile
    	client.upload "/"+params[:file].original_filename.to_s, file_content
    	link = client.create_shared_link_with_settings("/"+params[:file].original_filename.to_s, {})
    	@video.link =  link::url.to_s[0,link::url.to_s.size-1]+'1'
    	@video.user_id = params[:user_id].to_i
    	@video.comment = params[:comment]
      @video.remote_path  = "/"+params[:file].original_filename.to_s
    	if @video.save
        flash[:notice]= 'Video subido correctamente'
    		redirect_to admin_videos_path
    	end

    rescue DropboxApi::Errors::SharedLinkAlreadyExistsError
      flash[:notice]= 'Error: Un video con ese mismo nombre ya estaba almacenado'
      redirect_to admin_videos_path
    #rescue Exception
      #flash[:notice]= 'Error: Se ha producido un problema. Por favor intente de nuevo'
      #redirect_to admin_videos_path
    end


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
    @videos = Video.where(user_id: params[:id])
  end

  def clearDropbox
    @random = SecureRandom.base58(6)
  end

  def clear
    if params[:original] == params[:user_input]
      client = DropboxApi::Client.new("bulRELf_jgAAAAAAAAAACN0I0-tJgLdc8QsH5Let93vT5CCbi6jRPQFW5VEjSFc5")
      videos = Video.all
      videos.each do |video|
        client.delete video.remote_path
      end

      videos.each do |video|
        video.destroy
      end

      flash[:notice]= 'Todos los videos fueron correctamente removidos de Dropbox y la base de datos correctamente.'
      redirect_to admin_videos_path

    else
      flash[:notice]= 'El código de confirmación no era el mismo. Por favor vuelva a intentarlo'
      redirect_to admin_videos_clearDropbox_path
    end
  end





end
