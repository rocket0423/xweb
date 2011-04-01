class AdminController < ApplicationController
  
  #goes to admin page
  def index
    @user = User.find(session[:user_id])
  end

end
