class SessionsController < ApplicationController

  def new
  end

  def create
    # Allows users to log in with either their email or username
    user = User.find_by(email: params[:email] || username: params[:username])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, flash error and redirect them back to the login form.
    flash[:message] = "Username or Password error."
    redirect_to new_user_path
    end
  end

  def destroy
    # Sets session to nil, then redirects to main page
    session[:user_id] = nil
    redirect_to new_user_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
