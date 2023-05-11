class ReaderBooksController < ApplicationController
  def index
    @reader = Reader.find(params[:reader_id])
    @books = @reader.books
  end
end