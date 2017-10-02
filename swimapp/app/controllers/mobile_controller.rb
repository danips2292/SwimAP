class MobileController < ApplicationController

  layout 'layouts/_mobile'

  def assistance
  	@groups = Group.all
  end



  def new_assistance
  	@assistance = Assistance.new(assistance_params)
    if @assistance.save
      redirect_to(:action => 'selectStudents', :id => @assistance.id)
    else
      flash[:notice] = "Error al crear el nuevo registro, Intente de nuevo"
      redirect_to(:action => 'assistance')
    end
  end

  def selectStudents
    @group  = Assistance.find(params[:id]).group_id
    @students = User.where(:group_id => @group)
  end

  def finishAssistance
    @group  = Assistance.find(params[:id]).group_id
    @students = User.where(:group_id => @group)
    @assistance_id = params[:id]
    @students.each do |student| 
    @new_assistance_record = AssistancesUser.new(user_id: student.id, assistance_id: @assistance_id )
    if params.has_key?(student.id.to_s)
        @new_assistance_record.present = true
      else
        @new_assistance_record.present = false
      end
      @new_assistance_record.save
    end

    redirect_to(:action => 'finishedAssistance')
  end


  def ranking
  end

  def comments
  end


  def assistance_params
      params.require(:assistance).permit(:name, :group_id)
  end
end
