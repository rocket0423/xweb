class UsersController < ApplicationController
  skip_before_filter :authorize
  # GET /users
  # GET /users.xml
  def index
    if User.find_by_id(session[:user_id])
      @users = User.all
      
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @users }
      end
    else
      redirect_to login_url, :notice => "Please log in"
    end
  end
  
  # GET /users/1
  # GET /users/1.xml
  def show
    if User.find_by_id(session[:user_id])
      @user = User.find(params[:id])
      
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @user }
      end
    else
      redirect_to login_url, :notice => "Please log in"
    end
  end
  
  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # GET /users/1/edit
  def edit
    if User.find_by_id(session[:user_id])
      @user = User.find(params[:id])
    else
      redirect_to login_url, :notice => "Please log in"
    end
  end
  
  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /users/1
  # PUT /users/1.xml
  def update
    if User.find_by_id(session[:user_id])
      @user = User.find(params[:id])
      
      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to login_url, :notice => "Please log in"
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    if User.find_by_id(session[:user_id])
      @user = User.find(params[:id])
      begin
        @user.destroy
        flash[:notice] = "User #{@user.name} deleted"
      rescue Exception => e
        flash[:notice] = e.message
      end
      
      respond_to do |format|
        format.html { redirect_to(users_url) }
        format.xml  { head :ok }
      end
    else
      redirect_to login_url, :notice => "Please log in"
    end
  end
end
