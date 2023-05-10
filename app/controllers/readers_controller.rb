class ReadersController < ApplicationController
  def index
    @readers = Reader.all
  end
end