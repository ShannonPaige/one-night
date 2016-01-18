require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase

  test "a favorite can be created" do
    favorite = Favorite.find_or_create_fave('test-id', 'test-category')

    assert_equal 1,                 Favorite.all.count
    assert_equal 'test-id',         favorite.api_id
    assert_equal 'test-category',   favorite.category
  end

  test "a favorite can be found" do
    Favorite.find_or_create_fave('test-id', 'test-category')
    favorite = Favorite.find_or_create_fave('test-id', 'test-category')

    assert_equal 1,                 Favorite.all.count
    assert_equal 'test-id',         favorite.api_id
    assert_equal 'test-category',   favorite.category
  end
end
