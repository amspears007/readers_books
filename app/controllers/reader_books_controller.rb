class ReaderBooksController < ApplicationController
  def index
    @reader = Reader.find(params[:reader_id])
    @books = sorts_and_displays
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

  def sorts_and_displays
    if !params[:year_written].nil?
      @reader.books_before(params[:year_written])
    else
      @reader.sorts_alphabetically(params[:sort])
    end
  end
end