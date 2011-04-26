class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end
  
  # GET /categories/1
  # GET /categories/1.xml
  def show
    if Category.find_by_id(params[:id])
      @category = Category.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @category }
      end
    else
      redirect_to categories_url
    end
  end
  
  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end
  
  # GET /categories/1/edit
  def edit
    if Category.find_by_id(params[:id])
      @category = Category.find(params[:id])
    else
      redirect_to categories_url
    end
  end
  
  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to(@category, :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    if Category.find_by_id(params[:id])
      @category = Category.find(params[:id])
    
      respond_to do |format|
        if @category.update_attributes(params[:category])
          format.html { redirect_to(@category, :notice => 'Category was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to categories_url
    end
  end
  
  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    if Category.find_by_id(params[:id])
      @category = Category.find(params[:id])
      deleteSubCat(@category)
      @category.destroy
    
      respond_to do |format|
        format.html { redirect_to(categories_url) }
        format.xml  { head :ok }
      end
    else
      redirect_to categories_url
    end
  end
  
    # cascading delete
  def deleteSubCat(cat)
    @sub_by_cat = Subcategory.find_all_by_categories_id(cat.id);
    @sub_by_cat.each do |cat1|
      deleteWord(cat1)
      cat1.destroy
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
