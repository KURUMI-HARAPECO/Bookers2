class HomesController < ApplicationController

  def top
  end

  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

    private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
