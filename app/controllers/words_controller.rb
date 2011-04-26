class WordsController < ApplicationController
  # GET /words
  # GET /words.xml
  def index
    @words = Word.all
    @words_by_sub = Word.find_all_by_subcategories_id(params[:mySub]);
    @rand = Word.find_all_by_subcategories_id(params[:mySub], :order => "RANDOM()", :limit => 1);
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @words }
    end
  end
  
  # GET /words/1
  # GET /words/1.xml
  def show
    if Word.find_by_id(params[:id])
      @word = Word.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @word }
      end
    else
      redirect_to words_url
    end
  end
  
  # GET /words/new
  # GET /words/new.xml
  def new
    @word = Word.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @word }
    end
  end
  
  # GET /words/1/edit
  def edit
    if Word.find_by_id(params[:id])
      @word = Word.find(params[:id])
    else
      redirect_to words_url
    end
  end
  
  # POST /words
  # POST /words.xml
  def create
    @word = Word.new(params[:word])
    letters = "abcdefghijklmnopqrstuvwxyz"
    letters_up = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    correctLetters = "111111111111111111111111111"
    numberLetter=0
    numberUnique=0
    j=0
    #loop to determine what letters are in the word modifing correctLetters
    #array with 0 for letters that are in the word
    while j<@word.word.length do
      i = 0
      while i < correctLetters.length  do
        if @word.word[j] == letters[i] || @word.word[j] == letters_up[i]
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
    
    respond_to do |format|
      #determine if no letters are in word throw error
      if numberUnique == 0
        format.html { render :action => "new" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      else
        if @word.save  
          #determine score for each word
          @word.button_score = ((1000*numberUnique)/(numberLetter*6*(21-numberUnique)))
          @word.points = (1000/(numberUnique*numberLetter))
          @word.letter_seq = correctLetters
          @word.save
          format.html { redirect_to(@word, :notice => 'Word was successfully created.') }
          format.xml  { render :xml => @word, :status => :created, :location => @word }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  
  # PUT /words/1
  # PUT /words/1.xml
  def update
    if Word.find_by_id(params[:id])
      @word = Word.find(params[:id])
      @word2 = Word.new(params[:word])
      letters = "abcdefghijklmnopqrstuvwxyz"
      letters_up = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      correctLetters = "111111111111111111111111111"
      numberLetter=0
      numberUnique=0
      j=0
      #loop to determine what letters are in the word modifing correctLetters
      #array with 0 for letters that are in the word
      while j<@word2.word.length do
        i = 0
        while i < correctLetters.length  do
          if @word2.word[j] == letters[i] || @word2.word[j] == letters_up[i]
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
    
      respond_to do |format|
        #determine if no letters in word throw error if no letters
        if numberUnique == 0
          format.html { render :action => "edit" }
          format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
        else
          if @word.update_attributes(params[:word])
            #determine score for each word
            @word.button_score = ((1000*numberUnique)/(numberLetter*6*(21-numberUnique)))
            @word.points = (1000/(numberUnique*numberLetter))
            @word.letter_seq = correctLetters
            @word.save
            format.html { redirect_to(@word, :notice => 'Word was successfully updated.') }
            format.xml  { head :ok }
          else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
          end
        end
      end
    else
      redirect_to words_url
    end
  end
  
  # DELETE /words/1
  # DELETE /words/1.xml
  def destroy
    if Word.find_by_id(params[:id])
      @word = Word.find(params[:id])
      deleteUserAccess(@word)
      @word.destroy
    
      respond_to do |format|
        format.html { redirect_to(words_url) }
        format.xml  { head :ok }
      end
    else
      redirect_to words_url
    end
  end
  
  def deleteUserAccess(word)
    @user_by_word = User.find_all_by_word_id(word.id);
    @user_by_word.each do |word1|
       word1.active = nil
       word1.active = nil
       word1.hangman_id = nil
       word1.word_id = nil
       word1.save
    end
  end
  
end
