require 'test_helper'
require 'pry'

class BooksControllerTest < ActionDispatch::IntegrationTest

  test "can get welcome page" do
    get root_url
    assert_response :success
    assert_match(/Welcome to the place where books are/, response.body)
  end

  test "can get books index" do
    get books_url
    assert_response :success
    assert_match(/Here is your list of books:/, response.body)
  end

  test "can get create book view" do
    get new_book_url
    assert_response :success
    assert_match(/Enter some info for the new book:/, response.body)
  end

  test "can get edit book view" do
    get edit_book_url(books(:hobbit).id)
    assert_response :success
    assert_match(/Edit your book's info:/, response.body)
  end

  test "can get book view" do
    get book_url(books(:hobbit).id)
    assert_response :success
    assert_match(/Here are some details about your book:/, response.body)
  end

  test "can create a book" do
    post books_url, params: { book: { name: "The Two Towers"}}
    assert_response :redirect
    assert_equal "The Two Towers", Book.last.name
  end

  test "can delete a book" do
    delete book_url(books(:hobbit).id)
    delete book_url(books(:lotr).id)
    assert_response :redirect
    refute Book.any?
  end

  test "can edit a book" do
    patch book_url(books(:hobbit).id), params: { book: { name: "Not The Hobbit" }}
    assert_response :redirect
    assert_equal "Not The Hobbit", Book.find(books(:hobbit).id).name
  end
end
