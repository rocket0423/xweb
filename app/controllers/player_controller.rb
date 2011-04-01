class PlayerController < ApplicationController
  skip_before_filter :authorizeAdministrator
  protect_from_forgery :only => [:index] 
  
  # main page to choose categories
  def index
    @user = User.find(session[:user_id])
    #sends information whether another game is already active
    if(@user.word_id==nil || @user.active==nil || @user.hangman_id==nil)
      @valid = 1
    else
      @valid = 0
    end
  end
  
  #controller for buttons pressed to where to go based on button pressed
  def choose
    #goes to leaderboard if leaderboard button presed
    if params[:LeaderBoard]=="3"
      redirect_to leaderboard_url
    else
      #continues saved previous game user was playing
      if params[:PrevGame]=="2"
        redirect_to game_url
      else
        #starts new game from 3 box choices
        if params[:SubmitChoice]=="1"
          #chooses a random word
          @rand = Word.find_all_by_subcategories_id(params[:SubCat], :order => "RANDOM()", :limit => 1)
          if (@rand[0] != nil)
            @user = User.find(session[:user_id])
            #if active game already determine if game finnished and modify score to loosing
            if(@user.word_id!=nil && @user.active!=nil || @user.hangman_id!=nil)
              @word = Word.find(@user.word_id)
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
            end
            #setup new word for user
            @user.word_id = @rand[0].id
            @user.active = "111111111111111111111111111"
            @user.hangman_id = params[:HangMan]
            @user.score += Word.find(@rand[0].id).button_score*7
            @user.save
            redirect_to game_url
          else
            redirect_to player_url
          end
        else
          redirect_to player_url
        end
      end
    end
    
    
  end
  
end
