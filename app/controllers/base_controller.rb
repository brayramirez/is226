class BaseController < ApplicationController

  before_action :authenticate_user!
  before_action :restrict_disabled_user


  def restrict_disabled_user
    if current_user && current_user.disabled?
      sign_out current_user
      flash[:error] = ['Your account has been disabled!']

      redirect_to new_user_session_path and return
    end
  end


  def current_role
    current_user.role if current_user
  end
  helper_method :current_role

end