class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
    else
       render "users/edit"
    end
  end

  def edit
    if User.find(params[:id]) == current_user
       @user = User.find(params[:id])
    else
       redirect_to user_path(current_user.id)
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :profile_image, :introduction)
  end










end






