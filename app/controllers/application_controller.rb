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
      # !! current_user_session
      true # FIXME
    end

    def require_login
      redirect_to login_path unless logged_in?
    end

    def require_logout
      redirect_to app_path if logged_in?
    end
end
