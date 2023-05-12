class ReadersController < ApplicationController
  def index
    # @readers = Reader.all
    @readers = Reader.sort_by_most_recently_created
    
  end

  def show
    @reader = Reader.find(params[:id])
    @book_number= @reader.books.size
  end

  def new
  
  end
end