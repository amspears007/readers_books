class ReaderBooksController < ApplicationController
  def index
    @reader = Reader.find(params[:reader_id])
    @books = @reader.books
  end

  def new
    
  end

  def create
    # require 'pry'; binding.pry
    reader = Reader.find(params[:reader_id])
    reader.books.create!(reader_books_params)
    redirect_to "/readers/#{reader.id}/books"
    # require 'pry'; binding.pry
  end

  private
  def reader_books_params
    params.permit(:title, :author, :genre, :year_written, :fiction)
  end
end