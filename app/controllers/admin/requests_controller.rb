class Admin::RequestsController < ApplicationController
	layout 'layouts/_admin_partial'
   before_action :confirm_logged_in
  before_action :validates_admin_access
 
 
  def index
  	@users = User.pending
  end

  def accept
  	@user = User.find(params[:id])
  	if @user.update(is_accepted: true)
  		flash[:notice] = [@user.full_name, "fue acceptado. El usuario ya puede acceder a la cuenta"].join(" ")
  		redirect_to admin_requests_index_path
  	else
  		flash[:notice] =  @user.errors.details.keys.map { |attr| @user.errors.full_messages_for(attr).first}.join(", ")
  		redirect_to admin_requests_index_path

  	end
  end

  def reject
  	@user = User.find(params[:id])
  	if @user.destroy
  		flash[:notice] = [@user.full_name, "fue eliminado"].join(" ")
  		redirect_to admin_requests_index_path
  	else
  		flash[:notice] =  @user.errors.details.keys.map { |attr| @user.errors.full_messages_for(attr).first}.join(", ")
  		redirect_to admin_requests_index_path
  	end
  end
end
