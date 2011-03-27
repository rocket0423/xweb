class SessionsController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :authorizeAdministrator
  def new
    if User.find_by_id(session[:user_id])
      redirect_to admin_url
    end
  end
  
  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      if user.administrator
        redirect_to admin_url
      else
        redirect_to game_url
      end
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => "Logged out"
  end
  
end
