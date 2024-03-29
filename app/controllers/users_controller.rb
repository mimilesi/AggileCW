class UsersController < ApplicationController
 before_filter :authenticate, :except => [:show, :new, :create]
 before_filter :correct_user, :only => [:edit, :update]
 before_filter :admin_user,   :only => :destroy
 
 def new
    @title = "Sign up"
    @user = User.new
end  
 
  def index
    @title = "All users"
    @users = User.all
  end
   
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
    @title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Discover Box Hills"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end  
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  
  def destroy
    @user.destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  
  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      @user = User.find(params[:id])
      redirect_to(root_path) if !current_user.admin? || current_user?(@user)
    end
end