class GameController < ApplicationController
  skip_before_filter :authorizeAdministrator
  protect_from_forgery :only => [:index] 
  
  def index
    @user = User.find(session[:user_id])
    guess = @user.active
    @user.active2 = guess
    @user.save
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def update
    clicked = params[:buttonClicked].to_i
    @user = User.find(session[:user_id])
    if (clicked >= 0 && clicked < 27)
      guess = @user.active2
      guess[clicked.to_i] = "0"
      @user.active = guess
      @user.save
    else 
      if (clicked == 27)
        @user.active = "111111111111111111111111111"
        @user.save
      end
    end
    redirect_to game_url
    
  end

end
