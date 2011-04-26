class GameController < ApplicationController
  skip_before_filter :authorizeAdministrator
  protect_from_forgery :only => [:index] 
  
  #standard call to index main game application
  def index
    @user = User.find(session[:user_id])
    # makes sure all values are there before starting a game
    if(@user.word_id==nil || @user.active==nil || @user.hangman_id==nil)
      resetUser(@user)
    else
      # set up of final game
      @getWord = Word.find(@user.word_id)
      @getSubCat = Subcategory.find(@getWord.subcategories_id)
      @getCat = Category.find(@getSubCat.categories_id)
      guess = @user.active
      @user.active2 = guess
      @user.save
      @word = Word.find(@user.word_id)
      @hang = HangMan.find(@user.hangman_id)
      
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @user }
      end
    end
  end
  
  # call to update user information about word and direct back to game
  # or to another page depending on button clicked
  def update
    @user = User.find(session[:user_id])
    #make sure values are there before continuing with modifications
    if(@user.word_id==nil || @user.active==nil || @user.hangman_id==nil)
      resetUser(@user)
    else
      clicked = params[:buttonClicked].to_i
      @word = Word.find(@user.word_id)
      # if letter or hint is clicked do this
      if (clicked >= 0 && clicked < 27)
        guess = @user.active2
        guess[clicked] = "0"
        @user.active = guess
        if guess[clicked] == @word.letter_seq[clicked]
          @user.score += @word.points
        else
          @user.score -= @word.button_score
        end
        @user.save
        redirect_to game_url
      else
        # leaderboard button
        if clicked == 28
          redirect_to leaderboard_url
        else 
          # home button
          if clicked == 29 
            redirect_to player_url
          else
            # new game consider lose if game not finished and remove points
            if (clicked == 27)
              incorrectChoices = 0
              missingLetters = 0
              i = 0
              while i<26 do
                if @user.active[i] == "0"
                  if @word.letter_seq[i] != @user.active[i]
                    incorrectChoices +=1
                  end
                else
                  if @word.letter_seq[i] == "0"
                    missingLetters +=1
                  end
                end
                i +=1
              end
              
              if missingLetters !=0
                if incorrectChoices < 6
                  if @user.active[26] == "0"
                    @user.score -= @word.button_score*(6-incorrectChoices)
                  else
                    @user.score -= @word.button_score*(7-incorrectChoices)
                  end
                end
              end
              # reset all user values
              resetUser(@user)
            else
              # not recognized button go back to game
              redirect_to game_url
            end
          end
        end
      end
    end  
  end
  
  # reset all user values
  def resetUser(user)
    user.active = nil
    user.active2 = nil
    user.word_id = nil
    user.hangman_id = nil
    user.save
    redirect_to player_url
  end
end