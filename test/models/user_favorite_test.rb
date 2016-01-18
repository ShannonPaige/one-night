require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  test "a user favorite can be created" do
    user = User.create(:name => "Shannon",
                :screen_name => "spaige",
                :uid => 1234,
                :oauth_token => "pizza",
                :oauth_token_secret => "secretpizza")
    favorite = Favorite.find_or_create_fave('test-id', 'test-category')
    user_favorite = UserFavorite.add_to_faves(user, favorite)

    assert_equal user.id,           user_favorite.user_id
    assert_equal favorite.id,       user_favorite.favorite_id
  end
end
