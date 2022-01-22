class ApplicationController < ActionController::Base


    helper_method :logged_in?, :current_user

    def current_user
      if session[:user_id]
        @usuario_session = Usuario.find_by_id(session[:user_id])
      end
    end

    def logged_in?
      !!current_user
    end
  
    def authorized
      redirect_to login_path unless logged_in?
    end

end
