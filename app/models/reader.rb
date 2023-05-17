class Reader < ApplicationRecord
  has_many :books, dependent: :destroy

  def self.sort_by_most_recently_created
    Reader.order(created_at: :desc)
  end

  def book_count
    books.size
  end

  def sorts_alphabetically(sort)
    if sort == "true"
    self.books.order(:title)
    else
      books
    end
  end

  def books_before(year)
    books.where("year_written < #{year}")
  end
end