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
      redirect_to books_url
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      redirect_to books_url
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url
  end

  def show
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :author, :isbn_no, :description)
  end
end
