class Readers::BooksController < ApplicationController
  def index
    @reader = Reader.find(params[:reader_id])
  end
end