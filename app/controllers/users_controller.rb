class UsersController < ApplicationController
  before_action :authenticate_user!
  # ログインしないと使えない
  # before_action :signed_in_user, only: [:edit, :update]
  # before_action :correct_user,   only: [:edit, :update]
  def index
    @book = Book.new
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    # 1人userから複数のbooksを持ってくる
  end
  def edit
    @user = User.find(params[:id])
  end

  # def edit
  #   if params[:id] == current_user.id
  #     @user = User.find(params[:id])
  #     render :edit
  #   else
  #     @user = current_user
  #     redirect_to :show
  #   end
  # end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  # def correct_user
  #   @user = User.find(params[:id])
  #   redirect_to(user_url(current_user)) unless @user == current_user
  # end

end
