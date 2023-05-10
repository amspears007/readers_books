class ReadersController < ApplicationController
  def index
    @readers = Reader.all
  end

  def show
    
  end
end