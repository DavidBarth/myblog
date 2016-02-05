class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  #used throughout views helper methods
  # will return user if session user id stored in session hash and finds user id in DB
  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  #used throughout views
  def logged_in?
    !!current_user
  end
  
  #helper method as before action
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perfom that action"
      redirect_to root_path
    end
  end
  
end
