class LeaderboardController < ApplicationController
  skip_before_filter :authorizeAdministrator
  protect_from_forgery :only => [:index] 
  
  def index
    @leaders = User.order("score DESC").limit(10)
  end
  
  def home
    redirect_to player_url
  end

end
