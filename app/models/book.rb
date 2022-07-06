class Book < ApplicationRecord
  belongs_to :user

  scope :in_my_collection, -> { where(in_my_collection: true) }
  scope :wishlist, -> { where(wishlist: true) }

  def self.create_from_collection(books)
    books.each do |book_hash|
      Book.create!(book_hash)
    end
  end
end
