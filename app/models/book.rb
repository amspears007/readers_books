class Book < ApplicationRecord
  belongs_to :reader

  def self.boolean_is_true
    Book.where('fiction = true')
  end
end