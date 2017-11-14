class Admin::PostsController < ApplicationController
  layout 'layouts/_admin_partial'
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in
  before_action :validates_admin_access
 

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @groups = Group.all
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    subject = '[SWIMTEC] Nueva noticia en su grupo!'
    body = 'Una nueva noticia ha sido agregada a su grupo. Puede acceder a swimtec.herokuapp.com para revisarla'
    post_attributes = post_params
    users_send_email = User.get_users_by_groups(post_attributes[:group_id])
    @post = Post.new(post_params)
     if @post.save
      users_send_email.each do |user_email|
        UserMailer.new_email(user_email.email, subject, body).deliver
      end
      redirect_to admin_posts_path
     else
      render 'new'
     end   
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      redirect_to admin_posts_path
    else
      render 'edit'
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])  
    @post.destroy 
    redirect_to admin_posts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :text, :group_id)
    end
end

