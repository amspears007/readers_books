class ReadersController < ApplicationController
  def index
    @readers = Reader.all
    @sorted_readers = Reader.order(created_at: :desc)
    
  end

  def show
    @reader = Reader.find(params[:id])
  end
end