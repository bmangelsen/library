class BooksController < ApplicationController
  def welcome
  end

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to index_url
    else
      render :new
    end
  end

  def book_params
    params.require(:book).permit(:name, :author, :isbn_no, :description)
  end
end
