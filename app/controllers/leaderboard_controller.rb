class LeaderboardController < ApplicationController
  skip_before_filter :authorizeAdministrator
  protect_from_forgery :only => [:index] 
  
  #creates a list of 10 leaders and goes to leaderboard page
  def index
    @leaders = User.order("score DESC").limit(10)
  end
  
  #goes to player page when home button clicked on leaderboard page
  def home
    redirect_to player_url
  end

end
