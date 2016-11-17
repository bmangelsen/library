require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest

  test "can get reservations index" do
    Reservation.delete_all
    get reservations_path
    assert_response :success
    assert_match(/There are no reservations!/, response.body)
  end

  test "can see reservations for a book" do
    get book_reservations_path(books(:hobbit).id)
    assert_response :success
    assert_match(/Here is the list of reservations:/, response.body)
  end

  test "can see specific reservation" do
    get book_reservation_path(books(:hobbit).id, reservations(:ben).id)
    assert_match(/Here are some details about your reservation:/, response.body)
  end

  test "can see new reservation view" do
    get new_book_reservation_path(books(:hobbit).id)
    assert_match(/Enter some info for the new reservation:/, response.body)
  end

  test "can see update reservation view" do
    get edit_book_reservation_path(books(:hobbit).id, reservations(:ben).id)
    assert_match(/Edit your reservation's info:/, response.body)
  end

  test "can create reservation" do
    post book_reservations_path(books(:hobbit).id),
    params: { reservation: { name: "Jim", due_date: Date.new(2016,12,12), book_id: books(:hobbit).id }}
    assert_equal "Jim", Reservation.last.name
  end

  test "can edit reservation" do
    patch book_reservation_path(books(:hobbit).id, reservations(:ben).id),
    params: { reservation: { name: "Bob" }}
    assert_equal "Bob", Reservation.first.name
  end

  test "can delete reservation" do
    delete book_reservation_path(books(:hobbit).id, reservations(:ben).id)
    assert_equal 1, Reservation.count
  end
end
