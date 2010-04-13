# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :logged_in?, :current_user
  
  protected
  
  def logged_in?
    !current_user.nil?
  end
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  
  def require_authentication
    unless logged_in?
      flash[:error] = "You need to login first"
      redirect_to login_path
    end
  end
end
