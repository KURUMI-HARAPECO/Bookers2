class UsersController < ApplicationController
  def index
    @books = Book.all
  end
  def edit
    @users = User.all
    @user = User.find(params[:id])
  end
end
