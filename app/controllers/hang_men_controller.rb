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
    @hang_man = HangMan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hang_man }
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
    @hang_man = HangMan.find(params[:id])
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
  end

  # DELETE /hang_men/1
  # DELETE /hang_men/1.xml
  def destroy
    @hang_man = HangMan.find(params[:id])
    @hang_man.destroy

    respond_to do |format|
      format.html { redirect_to(hang_men_url) }
      format.xml  { head :ok }
    end
  end
end
