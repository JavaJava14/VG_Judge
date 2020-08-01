class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?

  def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

  def logged_in?
   !!current_user
  end

  def require_login
    unless logged_in?
      flash[:alert] = "Enter credentials to login"
      redirect_to root_path
    end
  end
end
