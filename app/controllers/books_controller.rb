class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    # require 'pry'; binding.pry
    book.update(title: params[:title], author: params[:author], genre: params[:genre], year_written: params[:year_written], fiction: params[:fiction])
    redirect_to "/books/#{book.id}"

  end
end