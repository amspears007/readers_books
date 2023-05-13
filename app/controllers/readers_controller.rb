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

  def create
    Reader.create!(reader_params)
    # require 'pry'; binding.pry
   
    redirect_to "/readers"
  end

  def edit
    @reader = Reader.find(params[:id])

  end

  def update
    @reader = Reader.find(params[:id])
    @reader.update(reader_params)
    redirect_to "/readers/#{@reader.id}"

  end

  private
    def reader_params
      params.permit(:name, :age, :avid_reader)
    end
end