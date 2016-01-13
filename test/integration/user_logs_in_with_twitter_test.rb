require "test_helper"

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "Login"
    assert_equal "/", current_path
    #TO DO - Add back in after profile page is set up
    #assert page.has_content?("Shannon")
    assert page.has_link?("Logout")
  end
end
