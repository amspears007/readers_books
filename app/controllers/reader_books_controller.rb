class ReaderBooksController < ApplicationController
  def index
    @reader = Reader.find(params[:reader_id])
    @books = @reader.sorts_alphabetically(params[:sort])
  end

  def new
    
  end

  def create
    reader = Reader.find(params[:reader_id])
    reader.books.create!(reader_books_params)
    redirect_to "/readers/#{reader.id}/books"
  end

  private
  def reader_books_params
    params.permit(:title, :author, :genre, :year_written, :fiction)
  end
end