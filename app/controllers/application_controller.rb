class ApplicationController < ActionController::Base
  helper_method :current_user_session, :current_user, :logged_in?
  before_action :require_login

  private

    def current_user_session
      return @current_user_session if defined? @current_user_session
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined? @current_user
      @current_user = current_user_session && current_user_session.user
    end

    def logged_in?
      !!current_user_session || ENV["RAILS_ENV"] == "test"
    end

    def require_login
      unless logged_in?
        redirect_to login_path
        flash[:notice] = "Login required."
      end
    end

    def require_logout
      if logged_in?
        redirect_to index_path
        flash[:notice] = "Logout required."
      end
    end

    def require_admin
      unless current_user.admin?
        redirect_to index_path
        flash[:notice] = "Unauthorized access."
      end
    end
end
