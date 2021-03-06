class HangMenController < ApplicationController
  # GET /hang_men
  # GET /hang_men.xml
  def index
    @hang_men = HangMan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hang_men }
    end
  end

  # GET /hang_men/1
  # GET /hang_men/1.xml
  def show
    if HangMan.find_by_id(params[:id])
      @hang_man = HangMan.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @hang_man }
      end
    else
      redirect_to hang_men_url
    end
  end

  # GET /hang_men/new
  # GET /hang_men/new.xml
  def new
    @hang_man = HangMan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hang_man }
    end
  end

  # GET /hang_men/1/edit
  def edit
    if HangMan.find_by_id(params[:id])
      @hang_man = HangMan.find(params[:id])
    else
      redirect_to hang_men_url
    end
  end

  # POST /hang_men
  # POST /hang_men.xml
  def create
    @hang_man = HangMan.new(params[:hang_man])

    respond_to do |format|
      if @hang_man.save
        format.html { redirect_to(@hang_man, :notice => 'Hang man was successfully created.') }
        format.xml  { render :xml => @hang_man, :status => :created, :location => @hang_man }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hang_man.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hang_men/1
  # PUT /hang_men/1.xml
  def update
    if HangMan.find_by_id(params[:id])
      @hang_man = HangMan.find(params[:id])

      respond_to do |format|
        if @hang_man.update_attributes(params[:hang_man])
          format.html { redirect_to(@hang_man, :notice => 'Hang man was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @hang_man.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to hang_men_url
    end
  end

  # DELETE /hang_men/1
  # DELETE /hang_men/1.xml
  def destroy
    if HangMan.find_by_id(params[:id])
      @hang_man = HangMan.find(params[:id])
      deleteUserAccess(@hang_man)
      @hang_man.destroy

      respond_to do |format|
        format.html { redirect_to(hang_men_url) }
        format.xml  { head :ok }
      end
    else
      redirect_to hang_men_url
    end
  end
  
   def deleteUserAccess(word)
    @user_by_word = User.find_all_by_hangman_id(word.id);
    @user_by_word.each do |word1|
       word1.active = nil
       word1.active = nil
       word1.hangman_id = nil
       word1.word_id = nil
       word1.save
    end
  end
  
end
