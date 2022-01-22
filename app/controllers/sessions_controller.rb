class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    @usuario_session = Usuario.find_by(email: params[:email])
    if @usuario_session && @usuario_session.authenticate(params[:password]) && @usuario_session.rol_id == 1
      session[:user_id] = @usuario_session.id
      redirect_to @usuario_session
    elsif
      @usuario_session && @usuario_session.authenticate(params[:password]) && @usuario_session.rol_id == 2
      session[:user_id] = @usuario_session.id
      redirect_to  usuario_usuarios_clases_path(session[:user_id])
    else  
      redirect_to login_path
    end
  end

  
  #def destroy
    #session[:user_id] = nil
    #redirect_to root_url, notice: "Logged out!"
  #end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end


