class UpdatetablesController < ApplicationController
  def update
    User.all.each do |user|
      if user.administrator ==nil
        user.administrator = false
      end
      if user.score == nil
        user.score = 0
      end
      user.save
    end
    
    HangMan.all.each do |hang|
      if hang.name ==nil
        hang.name="Hang"
      end
      hang.save
    end
    
    Word.all.each do |word|
      letters = "abcdefghijklmnopqrstuvwxyz"
      letters_up = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      correctLetters = "111111111111111111111111111"
      
      numberLetter=0
      numberUnique=0
      j=0
      while j<word.word.length do
        i = 0
        while i < correctLetters.length  do
          if word.word[j] == letters[i] || word.word[j] == letters_up[i]
            if correctLetters[i] != "0"
              correctLetters[i]="0"
              numberUnique +=1
            end
            numberLetter +=1
            i = correctLetters.length
          end
          i +=1
        end
        j +=1
      end
      
      word.button_score = ((1000*numberUnique)/(numberLetter*6*(21-numberUnique)))
      word.points = (1000/(numberUnique*numberLetter))
      word.letter_seq = correctLetters
      word.save
    end
    redirect_to player_url
  end
  
end
