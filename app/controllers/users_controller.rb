class UsersController < ApplicationController
  def index
    @books = Book.all
  end
  def show
    @user = User.all
  end
end
