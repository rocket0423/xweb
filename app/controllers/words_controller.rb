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
    @word = Word.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @word }
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
    @word = Word.find(params[:id])
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
    
    @word.button_score = ((1000*numberUnique)/(numberLetter*6*(21-numberUnique)))
    @word.points = (1000/(numberUnique*numberLetter))
    @word.letter_seq = correctLetters
    @word.save
    
    respond_to do |format|
      if @word.save
        format.html { redirect_to(@word, :notice => 'Word was successfully created.') }
        format.xml  { render :xml => @word, :status => :created, :location => @word }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /words/1
  # PUT /words/1.xml
  def update
    @word = Word.find(params[:id])
    letters = "abcdefghijklmnopqrstuvwxyz"
    letters_up = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    correctLetters = "111111111111111111111111111"
    
    numberLetter=0
    numberUnique=0
    j=0
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
    
    @word.button_score = ((1000*numberUnique)/(numberLetter*6*(21-numberUnique)))
    @word.points = (1000/(numberUnique*numberLetter))
    @word.letter_seq = correctLetters
    @word.save
    
    respond_to do |format|
      if @word.update_attributes(params[:word])
        format.html { redirect_to(@word, :notice => 'Word was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /words/1
  # DELETE /words/1.xml
  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    
    respond_to do |format|
      format.html { redirect_to(words_url) }
      format.xml  { head :ok }
    end
  end
end
