require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get index" do
    create_user
    get :index
    assert_response :success
  end
end
