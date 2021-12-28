class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.username}!!!"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your profile has been updated successfully"
      redirect_to posts_path
    else
      render "edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
