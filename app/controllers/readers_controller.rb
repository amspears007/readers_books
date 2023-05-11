class ReadersController < ApplicationController
  def index
    @readers = Reader.all
    @sorted_readers = Reader.sort_by_most_recently_created
    
  end

  def show
    @reader = Reader.find(params[:id])
  end
end