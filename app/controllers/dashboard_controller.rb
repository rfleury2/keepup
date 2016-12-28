class DashboardController < ApplicationController
  def show
    if current_user
      @user = current_user
    else
      flash[:alert] = "Log in to access your dashboard."
      redirect_to new_user_session_path
    end
  end
end