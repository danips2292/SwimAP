class Admin::StudentsController < ApplicationController
layout 'layouts/_admin_partial'
 before_action :confirm_logged_in
 before_action :validates_admin_access
 
 
  def index
    @students = User.all
    group_id = params[:group_id]
    if params[:group_id]
        @students = User.accepted_by_group(group_id).order("full_name DESC")
    else
        @students = User.accepted.order('full_name DESC')
    end    
  end

  def view_student
  	@student  =  User.find(params[:student_id])
    @group_id = @student.group_id
  	@assistancesGroup = Assistance.byGroupId(@group_id.to_i)
  	@from_time = Time.now
  	@comments = Comment.thisUserGroup(@student)
  	@videos = Video.where(user_id: @student.id)
  	@form = InitialForm.where(user_id: @student.id).first
 	@teamform = TeamForm.where(user_id: @student.id).first
  end
end
