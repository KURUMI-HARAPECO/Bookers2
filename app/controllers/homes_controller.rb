class HomesController < ApplicationController

  def top
  end

  def about
  end

  def index
    @book = Book.all
  end

  def show
  end
end
