class MobileController < ApplicationController

  layout 'layouts/_mobile'

  def assistance
  	@groups = Group.all
  end

  def new_assistance
  	@assistance = Assitance.new(assistamce_params)
    if @assistance.save
      redirect_to(:action => 'selectStudents', :id => @assistance.id)
    else
      flash[:notice] = "Error al crear el nuevo registro, Intente de nuevo"
      redirect_to(:action => 'assistance')
  end


  def ranking
  end

  def comments
  end


  def assistamce_params
      params.require(:assistance).permit(:name, :group_id)
    end
end
