class Admin::RequestsController < ApplicationController
	layout 'layouts/_admin_partial'
  def index
  	@users = User.pending
  end

  def accept
  	@user = User.find(params[:id])
  	@user.is_accepted = true
  	if @user.save
  		flash[:notice] = [@user.full_name, "fue acceptado. El usuario ya puede acceder a la cuenta"].join(" ")
  		redirect_to admin_requests_index_path
  	else
  		flash[:notice] =  @user.errors.details.keys.map { |attr| @user.errors.full_messages_for(attr).first}.join(", ")
  		redirect_to admin_requests_index_path

  	end
  end

  def reject
  end
end