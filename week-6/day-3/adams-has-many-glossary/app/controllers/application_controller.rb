class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user=(user)
    session[:user_id] = user.id
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  #returns boolean if logged in
  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  def authorize!
    redirect_to login_path unless logged_in?
  end
end
