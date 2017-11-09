class ApplicationController < ActionController::Base

  
  #protect_from_forgery with: :exception
  #before_action :authenticate_user!
  #before_filter :authenticate_user!
  #before_action :validate_access
 protect_from_forgery with: :exception


  private 
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Por favor inicie sesión"
      redirect_to access_index_path
      return false
    else
      return true      
    end
  end

  def validates_user_access
    group = Group.find(User.find(session[:user_id]).group_id)
    if group.tip_group == 'Regular'
      return true
    else
      flash[:notice] = "Acceso denegado"
      redirect_to root_path
      return false
    end
  end

  def validates_admin_access
    user = User.find(session[:user_id])
    if user.is_admin
      return true
    else
      flash[:notice] = "Acceso denegado"
      redirect_to root_path
      return false
    end

  end

  def validates_team_access
    group = Group.find(User.find(session[:user_id]).group_id)
    if group.tip_group == 'Equipo'
      return true
    else
      flash[:notice] = "Acceso denegado"
      redirect_to root_path
      return false
    end
  end

end
