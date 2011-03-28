class UsersController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create, :destroy]
  skip_before_filter :authorizeAdministrator, :only => [:new, :create, :dself]
  # GET /users
  # GET /users.xml
  def index
    @users = User.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # GET /users/new
  # GET /users/new.xml
  def new
    if User.find_by_id_and_administrator(session[:user_id], false)
      redirect_to game_url
    else
      @user = User.new
      
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @user }
      end
    end
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  
  # POST /users
  # POST /users.xml
  def create
    if User.find_by_id_and_administrator(session[:user_id], false)
      redirect_to game_url
    else
      @user = User.new(params[:user])
      @user.administrator = false
      @user.active = "11111111111111111111111111"
      @user.active2 = "11111111111111111111111111"
      
      if @user.save
        if !User.find_by_id(session[:user_id])
          session[:user_id] = @user.id
          redirect_to game_url
        else
          respond_to do |format|
            format.html { redirect_to(@user, :notice => 'User was successfully created.') }
            format.xml  { render :xml => @user, :status => :created, :location => @user }
          end
        end
      else
        respond_to do |format|
          format.html { render :action => "new" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  
  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    if @user.administrator && User.find_all_by_administrator(true).count==1
      respond_to do |format|
        if @user.update_attributes(params[:user])
          @user.administrator = true
          @user.save
          format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user2 = User.find(session[:user_id])
    if @user == @user2
      if User.find_all_by_administrator(true).count==1
        respond_to do |format|
          format.html { redirect_to(users_url, :notice => 'Unable to delete last admin') }
          format.xml  { head :ok }
        end
      else
        @user.destroy
        session[:user_id] = nil
        redirect_to login_url, :notice => "Deleted Account"
      end
    else
      @user.destroy
      respond_to do |format|
        format.html { redirect_to(users_url, :notice => 'User was successfully deleted') }
        format.xml  { head :ok }
      end
    end
  end
  
  #delete own account
  def dself
    @user = User.find(session[:user_id])
    if @user.administrator && User.find_all_by_administrator(true).count==1
      respond_to do |format|
        format.html { redirect_to(users_url, :notice => 'Unable to delete last admin') }
        format.xml  { head :ok }
      end
    else
      @user.destroy
      session[:user_id] = nil
      redirect_to login_url, :notice => "Deleted Account"
    end
  end
end
class UsersController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create, :destroy]
  skip_before_filter :authorizeAdministrator, :only => [:new, :create, :dself]
  # GET /users
  # GET /users.xml
  def index
    @users = User.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # GET /users/new
  # GET /users/new.xml
  def new
    if User.find_by_id_and_administrator(session[:user_id], false)
      redirect_to game_url
    else
      @user = User.new
      
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @user }
      end
    end
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  
  # POST /users
  # POST /users.xml
  def create
    if User.find_by_id_and_administrator(session[:user_id], false)
      redirect_to game_url
    else
      @user = User.new(params[:user])
      @user.administrator = false
      @user.active = "11111111111111111111111111"
      @user.active2 = "11111111111111111111111111"
      
      if @user.save
        if !User.find_by_id(session[:user_id])
          session[:user_id] = @user.id
          redirect_to game_url
        else
          respond_to do |format|
            format.html { redirect_to(@user, :notice => 'User was successfully created.') }
            format.xml  { render :xml => @user, :status => :created, :location => @user }
          end
        end
      else
        respond_to do |format|
          format.html { render :action => "new" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  
  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    if @user.administrator && User.find_all_by_administrator(true).count==1
      respond_to do |format|
        if @user.update_attributes(params[:user])
          @user.administrator = true
          @user.save
          format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user2 = User.find(session[:user_id])
    if @user == @user2
      if User.find_all_by_administrator(true).count==1
        respond_to do |format|
          format.html { redirect_to(users_url, :notice => 'Unable to delete last admin') }
          format.xml  { head :ok }
        end
      else
        @user.destroy
        session[:user_id] = nil
        redirect_to login_url, :notice => "Deleted Account"
      end
    else
      @user.destroy
      respond_to do |format|
        format.html { redirect_to(users_url, :notice => 'User was successfully deleted') }
        format.xml  { head :ok }
      end
    end
  end
  
  #delete own account
  def dself
    @user = User.find(session[:user_id])
    if @user.administrator && User.find_all_by_administrator(true).count==1
      respond_to do |format|
        format.html { redirect_to(users_url, :notice => 'Unable to delete last admin') }
        format.xml  { head :ok }
      end
    else
      @user.destroy
      session[:user_id] = nil
      redirect_to login_url, :notice => "Deleted Account"
    end
  end
end
