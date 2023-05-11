class Reader < ApplicationRecord
  has_many :books

  def self.sort_by_most_recently_created
    Reader.order(created_at: :desc)
  end
end