class ReadersController < ApplicationController
  def index
    @readers = Reader.all
  end

  def show
    @reader = Reader.find(params[:id])
  end
end