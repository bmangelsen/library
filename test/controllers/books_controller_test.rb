require 'test_helper'
require 'pry'

class BooksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "can get welcome page" do
    get welcome_url
    assert_response :success
    assert_match(/Welcome to the place where books are/, response.body)
  end

  test "can get books index" do
    get index_url
    assert_response :success
    assert_match(/Here is your list of books:/, response.body)
  end

  test "can get create book view" do
    get new_url
    assert_response :success
    assert_match(/Enter some info for the new book:/, response.body)
  end

  test "can create a book" do
    post create_url, params: { book: { name: "The Hobbit"}}
    assert_response :redirect
    assert_equal "The Hobbit", Book.last.name
  end

end
