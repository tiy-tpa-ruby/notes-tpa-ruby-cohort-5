class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end

class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  # Method to use in filter to ensure the user is logged in
  def authenticate!
    redirect_to login_path unless logged_in?
  end

  # Assign the current user
  def current_user=(user)
    session[:user_id] = user.id
  end
end
