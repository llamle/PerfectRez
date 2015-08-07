class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: user_params[:username])
      if @user && @user.authenticate(user_params[:password])
        login!(@user)
      else
        flash[:message] = "Username or Password error."
        redirect_to new_user_path
      end
    end

  def destroy
    logout!
    redirect_to new_user_path
  end

private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
