class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.book.all
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def edit
    if params[:id] === current_user.id
      @user = User.find(params[:id])
    else
      redirect_to user_path(current_user.id)
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image, :introduction)
  end










end






