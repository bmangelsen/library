require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  test "can create reservation" do
    assert Reservation.create!(name: "Ben", book_id: books(:hobbit).id)
  end
end
