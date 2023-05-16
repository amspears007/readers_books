class Reader < ApplicationRecord
  has_many :books, dependent: :destroy

  def self.sort_by_most_recently_created
    Reader.order(created_at: :desc)
  end

  def book_count
    books.size
  end
end