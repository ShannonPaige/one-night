require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get show" do
    create_user
    get :show
    assert_response :success
  end

end
