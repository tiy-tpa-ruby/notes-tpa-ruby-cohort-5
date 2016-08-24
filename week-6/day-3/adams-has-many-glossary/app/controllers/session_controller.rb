class SessionController < ApplicationController
  def new
  end

  def create
    # to be deleted for Oauth

    self.current_user = User.from_omniauth(request.env['omniauth.auth'])

    if current_user
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def failure
    #show failure
  end
end
