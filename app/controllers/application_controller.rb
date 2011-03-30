class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :authorizeAdministrator
  protect_from_forgery
  
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, :notice => "Please log in"
    end
  end
  
  def authorizeAdministrator
    unless User.find_by_id_and_administrator(session[:user_id], true)
      redirect_to player_url, :notice => "Administrator only"
    end
  end
end
