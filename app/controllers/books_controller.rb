class BooksController < ApplicationController
  def index
    @books = Book.all
    @fiction_books = Book.boolean_is_true
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to "/books/#{book.id}"
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to "/books"
  end

  private
    def book_params
      params.permit(:title, :author, :genre, :year_written, :fiction)
    end
end