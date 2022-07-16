class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :edit, :update, :destroy ]
  def index
    @books = Book.all

    if params[:query].present?
      @books = @books.in_my_collection.where("language ILIKE ?", "%#{params[:query]}%")
    else
      @books
    end

    respond_to do |format|
      format.html
      format.text { render partial: "shared/list", locals: {books: @books}, formats: [:html] }
    end
  end

  def show() end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book)
  end

  def edit() end

  def update
    @book.update(book_params)
    redirect_to params[:previous_request]
  end

  def destroy
    @book.destroy
    redirect_to books_path, status: :see_other
  end

  def collection
    @books = Book.in_my_collection

    # if params[:query].present?
    #   @books = @books.where("language ILIKE ?", "%#{params[:query]}%")
    # else
    #   @books
    # end

    # respond_to do |format|
    #   format.html
    #   format.text { render partial: "shared/list", locals: {books: @books}, formats: [:html] }
    # end
  end

  def wishlist
    @books = Book.wishlist
  end

  private

  def book_params
    params.require(:book).permit(:title, :language, :language_details, :country, :date_of_acquisition, :number_of_books, :notes, :in_my_collection, :wishlist)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def query
  end
end
