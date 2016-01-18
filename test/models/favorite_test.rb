require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase

  test "a favorite can be created" do
    favorite = Favorite.find_or_create_fave('test-id',
                                            'test-category',
                                            'test-name',
                                            'test-image-url',
                                            'test-address')

    assert_equal 1,                 Favorite.all.count
    assert_equal 'test-id',         favorite.api_id
    assert_equal 'test-category',   favorite.category
    assert_equal 'test-name',       favorite.name
    assert_equal 'test-image-url',  favorite.image_url
    assert_equal 'test-address',    favorite.address
  end

  test "a favorite can be found" do
    favorite1 = Favorite.find_or_create_fave('test-id',
                                            'test-category',
                                            'test-name',
                                            'test-image-url',
                                            'test-address')
    favorite2 = Favorite.find_or_create_fave('test-id',
                                            'test-category',
                                            'test-name',
                                            'test-image-url',
                                            'test-address')


    assert_equal 1,                 Favorite.all.count
    assert_equal favorite1.api_id,  favorite2.api_id
    assert_equal favorite1.name,    favorite2.name
  end
end
