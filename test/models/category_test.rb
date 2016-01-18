require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "a category returns true if it is an event" do
    category = :Event

    assert Category.event?(category)
  end

  test "a category returns false if it is an event" do
    category = :Bar

    refute Category.event?(category)
  end
end
