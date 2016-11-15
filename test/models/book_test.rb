require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "can create book" do
    assert Book.create!(name: "return of the king")
  end
end
