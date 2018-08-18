class DashboardController < ApplicationController
  before_action :require_login, only: [:index]

  def index
  end

  def profile
  end
end
