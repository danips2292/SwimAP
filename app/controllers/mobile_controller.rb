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
    @students = User.accepted_by_group(@group)
  end

  def finishAssistance
    @group  = Assistance.find(params[:id]).group_id
    @students = User.accepted_by_group(@group)
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

  #SECCION DE RANKING

  def ranking
    @team = Group.where(tip_group: "Equipo").first
    @students = User.where(group_id: @team.id)
  end

  def comments
    @groups = Group.all
  end

  def selectStudent
    @students = User.accepted_by_group(params[:id])
  end 

  def newRanking
    @student =  User.find(params[:id])
  end

  def addRanking 
     @ranking = RankingLine.new(ranking_params)
     @ranking.time = params[:ranking_line][:minutes]+":"+params[:ranking_line][:seconds]+":"+params[:ranking_line][:tenths]
    if @ranking.save
       redirect_to(:action => 'finishedRanking')
    end

  end

# TERMINA SECCION DE RANKING

  def newComment
    @student =  User.find(params[:id])
  end

  def addComment
    @comment  =  Comment.new(comment_params)
    if @comment.save
      subject = '[SWIMTEC] Nuevo comentario!'
        body = 'Se ha agregado un nuevo comentario de su progreso en el curso. Puede acceder a swimtec.herokuapp.com para verlo'
        UserMailer.new_email(User.find(@comment.user_id).email, subject, body).deliver
      redirect_to(:action => 'finishedComment')
    end
  end


  private 

  def assistance_params
      params.require(:assistance).permit(:name, :group_id)
  end

  def comment_params
      params.require(:comment).permit(:description, :user_id)
  end

  def ranking_params
    params.require(:ranking_line).permit(:user_id, :distance, :style)
  end

end
