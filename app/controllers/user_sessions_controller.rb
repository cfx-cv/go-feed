class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :require_logout, only: [:new, :create]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params)

    if @user_session.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to login_path
  end

  private

    def user_session_params
      params.require(:user_session).permit(:username, :password).to_h
    end
end
