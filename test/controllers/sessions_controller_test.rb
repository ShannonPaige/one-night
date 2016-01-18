require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get create" do
    create_auth_info
    get :create
    assert_response 302
  end

  test "should get destroy" do
    get :destroy
    assert_response 302
  end

end
