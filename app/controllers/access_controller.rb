class AccessController < ApplicationController
	layout 'layouts/_login'



  def index
    check_session_state
  end



  def signup
    check_session_state
    @groups = Group.all
    @user = User.new
  end



  def new
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Usuario creado exitosamente. Acceda a la cuenta!"
      redirect_to(:action => 'index')
    else
      flash[:notice] = @user.errors.details.keys.map { |attr| @user.errors.full_messages_for(attr).first}.join(", ")
      render('signup')
    end
  end


  def attempt_login
    if session[:user_id] != nil
      puts "Removing existing session session found..."
      session[:user_id] = nil
      session[:email] = nil
    end
  	if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      if found_user
        authorized_user =found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      if authorized_user.is_accepted
        session[:user_id] = authorized_user.id
        session[:email] = authorized_user.email
        flash[:notice] = "Bienvenido!"
        if authorized_user.is_admin
          redirect_to admin_index_path
        elsif Group.find(authorized_user.group_id).tip_group == 'Regular'
          redirect_to user_index_path
        elsif Group.find(authorized_user.group_id).tip_group == 'Equipo'
          redirect_to team_index_path
        end
      else
         redirect_to user_pending_index_path
    else
      flash[:notice] = "Correo o contraseña inválida "
      redirect_to(:action => 'login')
    end
  end




  def logout
    session[:user_id] = nil
    session[:email] = nil
    flash[:notice] = "Sesión Terminada"
    redirect_to access_index_path
  end




  private
    def user_params
      params.require(:user).permit(:full_name, :email, :email_confirmation, :password, :group_id)
    end

    def check_session_state
      if session[:user_id] != nil
        @user = User.find(session[:user_id])
        if @user.is_admin
          redirect_to admin_index_path
        elsif Group.find(@user.group_id).tip_group == 'Regular'
          redirect_to user_index_path
        elsif Group.find(@user.group_id).tip_group == 'Equipo'
          redirect_to team_index_path
        end
      end
    end


end
