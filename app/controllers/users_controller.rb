class UsersController < ApplicationController
  layout 'application'
  before_filter :not_logged_in_required, :only => [:new, :create]    
  before_filter :login_required, :only => [:show, :edit, :update]
  before_filter :check_administrator_role, :only => [:index, :destroy, :enable]
  
  def index
      @users = User.find(:all)
  end
  
  #This show action only allows users to view their own profile
  def show
      @user = current_user
      respond_to do |format|
        format.html {}
        format.xml {render :xml => @user }
        format.json  { render :json => @user.to_json }
      end
  end
    
  # render new.rhtml
  def new
    @user = User.new
  end

  def create
    cookies.delete :auth_token
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        #Uncomment to have the user logged in after creating an account - Not Recommended
        #self.current_user = @user
        flash[:notice] = "Thanks for signing up! Please check your email to activate your account before logging in."
        format.html { redirect_to login_path }
        format.xml { render :xml => @user, :status => :created, :location => @user }
        format.json  { render :json => @user.to_json }
      else
        format.html { flash[:error] = "There was a problem creating your account."
                      render :action => 'new' }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
        format.json  { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  def edit
    @user = current_user
  end
 
  def update
    @user = User.find(current_user)
    if @user.update_attributes(params[:user])
      flash[:notice] = "User updated"
      redirect_to :action => 'show', :id => current_user
    else
      render :action => 'edit'
    end
  end
 
  def destroy
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled, false)
      flash[:notice] = "User disabled"
    else
      flash[:error] = "There was a problem disabling this user."
    end
    redirect_to :action => 'index'
  end

  def enable
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled, true)
      flash[:notice] = "User enabled"
    else
      flash[:error] = "There was a problem enabling this user."
    end
      redirect_to :action => 'index'
  end
end
