class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :require_current_user

  before_action :ensure_users


private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_users
    # Ensures current user is logged in
    unless current_user
      @user = User.new
    end
  end

  def require_current_user
    # Requires a user to be logged in to view portions of the site, prevents jumping via url
    unless current_user
      flash[:message] = "You must be signed in to do that!"
      redirect_to new_user_path
    end
  end

  def authorize
    redirect_to '/login' unless current_user
  end
end
