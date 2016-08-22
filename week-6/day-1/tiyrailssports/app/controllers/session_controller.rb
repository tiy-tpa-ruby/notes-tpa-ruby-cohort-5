class SessionController < ApplicationController
  # logging in
  def new
  end

  # handle the post from the login page
  def create
    email = params[:email]
    password = params[:password]

    user = User.find_by(email: email)
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path
      # logged in!
    else
      # Nope, something went wrong
      redirect_to login_path
    end
  end

  # logout
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
