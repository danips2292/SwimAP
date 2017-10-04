class AccessController < ApplicationController
	layout 'layouts/_login'

  def index
  end

  def signup
    #@groups = Group.all.where('id = 1')
    @groups = Group.all
    @user = User.new
  end

  def new
    @user = User.new(user_params)
    if params[:email] == params[:email_confirm]
      if @user.save
        flash[:notice] = "Usuario creado exitosamente. Acceda a la cuenta!"
        redirect_to(:action => 'index')
      else
        flash[:notice] = "Intentelo de nuevo"
        render('signup')
      end
    else
      flash[:notice] = "Los emails no coinciden"
      redirect_to(:action => 'signup')
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
      session[:user_id] = authorized_user.id
      session[:email] = authorized_user.email
      flash[:notice] = "Bienvenido!"
      redirect_to('/admin')
    else
      flash[:notice] = "Correo o contraseña inválida "
      redirect_to(:action => 'index')
    end


  end

  def logout
    session[:user_id] = nil
    session[:email] = nil
    flash[:notice] = "Logged Out"
    redirect_to(:action => 'index')
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :group_id)
    end

end
