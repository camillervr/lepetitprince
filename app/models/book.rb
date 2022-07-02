class Book < ApplicationRecord
  belongs_to :user

  def self.create_from_collection(books)
    books.each do |book_hash|
      Book.create!(book_hash)
    end
  end
end
