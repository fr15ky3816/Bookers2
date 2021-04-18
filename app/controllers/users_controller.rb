class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.book
  end

  def update
  end

  def edit
    @user = User.find_by(id: current_user.id)
  end
end
