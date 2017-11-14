class Admin::GroupsController < ApplicationController
layout 'layouts/_admin_partial'

  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in
  before_action :validates_admin_access
 

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to admin_groups_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to admin_groups_path
    else
      render 'edit'
    end  
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @users = User.where(group_id: @group.id)
    @users.each do |user|
      AssistancesUser.where(user_id: @user.id).destroy
    end      
    User.where(group_id: @group.id).destroy_all
    Assistance.where(group_id: @group.id).destroy_all
    Post.where(group_id: @group.id).destroy_all
    if @users.empty?
      @group.destroy
    else
      Comment.where(user_id: @users.id).destroy_all
    end    
    @group.destroy
    redirect_to admin_groups_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name,:tip_group,:schedule)
    end
end
