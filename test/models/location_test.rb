require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "it can convert a thumbanail filename to full size filename" do
    assert_equal "http://someimagename/o.jpg", Location.yelp_image_name("http://someimagename/ms.jpg")
  end

  test "it can convert miles to meters" do
    assert_equal 3218.694175772889, Location.miles_to_meters("2")
  end

  test "it can assign a default address (Denver) when address is empty string" do
    assert_equal "Denver", Location.default_addess("")
  end

  test "it does not assign a default address when address is predefined" do
    refute_equal "Denver", Location.default_addess("San Diego")
  end
end
