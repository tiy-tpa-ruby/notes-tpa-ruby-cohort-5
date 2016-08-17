class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Returns the current user if logged in
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  helper_method :current_user

  # Returns a boolean representing if the user is logged in
  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  # Method to use in filter to ensure the user is logged in
  def authorize!
    unless logged_in?
      redirect_to login_path
    end
  end
end
