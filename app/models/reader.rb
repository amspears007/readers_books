class Reader < ApplicationRecord
  has_many :books

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
end