class GameController < ApplicationController
  skip_before_filter :authorizeAdministrator
  protect_from_forgery :only => [:index] 
  
  def index
    @user = User.find(session[:user_id])
    if(@user.word_id==nil || @user.active==nil || @user.hangman_id==nil)
      @user.active = nil
      @user.word_id = nil
      @user.hangman_id = nil
      @user.save
      redirect_to player_url
    else
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
  
  def update
    @user = User.find(session[:user_id])
    if(@user.word_id==nil || @user.active==nil || @user.hangman_id==nil)
      @user.active = nil
      @user.word_id = nil
      @user.hangman_id = nil
      @user.save
      redirect_to player_url
    else
      clicked = params[:buttonClicked].to_i
      @user = User.find(session[:user_id])
      @word = Word.find(@user.word_id)
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
        if clicked == 28
          redirect_to leaderboard_url
        else 
          if clicked == 29 
            redirect_to player_url
          else
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
              
              @user.active = nil
              @user.active2 = nil
              @user.word_id = nil
              @user.hangman_id = nil
              @user.save
              redirect_to player_url
            else
              redirect_to game_url
            end
          end
        end
      end
    end  
  end
end