class GameController < ApplicationController
  skip_before_filter :authorizeAdministrator
  protect_from_forgery :only => [:index] 
  
  def index
    @user = User.find(session[:user_id])
    if(@user.word_id==nil ||@user.active==nil)
      @user.active = nil
      @user.word_id = nil
      @user.save
      redirect_to player_url
    else
      guess = @user.active
      @user.active2 = guess
      @user.save
      @word = Word.find(@user.word_id)
      
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @user }
      end
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
      redirect_to game_url
    else 
      if (clicked == 27)
        @user.active = nil
        @user.active2 = nil
        @user.word_id = nil
        @user.save
        redirect_to player_url
      else
        redirect_to game_url
      end
    end
    
  end
  
end
