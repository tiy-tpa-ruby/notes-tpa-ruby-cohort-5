class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

private
  def user_params
    # Can't trust that sneaky params hash
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end






#
