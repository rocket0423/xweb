class PlayerController < ApplicationController
  skip_before_filter :authorizeAdministrator
  protect_from_forgery :only => [:index] 
  
  def index
  end
  
  def choose
    @rand = Word.find_all_by_subcategories_id(params[:SubCat], :order => "RANDOM()", :limit => 1)
    if (@rand[0] != nil)
      @user = User.find(session[:user_id])
      @user.word_id = @rand[0].id
      @user.active = "111111111111111111111111111"
      @user.save
      redirect_to game_url
    else
      redirect_to player_url
    end
    
    
  end
  
end
