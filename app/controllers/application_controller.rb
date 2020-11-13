class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def not_logged_in?
    redirect_to user_path(current_user) if logged_in?
  end

  def require_login
    unless logged_in?
      flash[:alert] = 'You must be logged in to continue with this action.'
      redirect_to login_path
    end
  end

  def icons
    %w[address-book
       ambulance
       bath
       bed
       building
       camera
       clock
       coffee
       fire
       headphones
       home
       leaf
       star]
  end
end
