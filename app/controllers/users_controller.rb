class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}!!!"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your profile has been updated successfully"
      redirect_to user_path
    else
      render "edit"
    end
  end

  def show
    @posts = @user.posts.paginate(page: params[:page], per_page: 4)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 4)
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notic] = " Account and associated posts have been deleted"
    redirect_to posts_path  
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user 
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin
      flash[:alert] = " You can only edit your own account"
      redirect_to current_user
    end

  end

end
