class SubcategoriesController < ApplicationController
  # GET /subcategories
  # GET /subcategories.xml
  def index
    @subcategories = Subcategory.all
    @sub_by_cat = Subcategory.find_all_by_categories_id(params[:myCat]);

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subcategories }
    end
  end

  # GET /subcategories/1
  # GET /subcategories/1.xml
  def show
    if Subcategory.find_by_id(params[:id])
      @subcategory = Subcategory.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @subcategory }
      end
    else
      redirect_to subcategories_url
    end
  end

  # GET /subcategories/new
  # GET /subcategories/new.xml
  def new
    @subcategory = Subcategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subcategory }
    end
  end

  # GET /subcategories/1/edit
  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  # POST /subcategories
  # POST /subcategories.xml
  def create
    @subcategory = Subcategory.new(params[:subcategory])

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to(@subcategory, :notice => 'Subcategory was successfully created.') }
        format.xml  { render :xml => @subcategory, :status => :created, :location => @subcategory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subcategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subcategories/1
  # PUT /subcategories/1.xml
  def update
    @subcategory = Subcategory.find(params[:id])

    respond_to do |format|
      if @subcategory.update_attributes(params[:subcategory])
        format.html { redirect_to(@subcategory, :notice => 'Subcategory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subcategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subcategories/1
  # DELETE /subcategories/1.xml
  def destroy
    @subcategory = Subcategory.find(params[:id])
    deleteWord(@subcategory)
    @subcategory.destroy

    respond_to do |format|
      format.html { redirect_to(subcategories_url) }
      format.xml  { head :ok }
    end
  end
  
    def deleteWord(subcat)
    @words_by_sub = Word.find_all_by_subcategories_id(subcat.id);
    @words_by_sub.each do |subcat1|
      deleteUserAccess(subcat1)
      subcat1.destroy
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
