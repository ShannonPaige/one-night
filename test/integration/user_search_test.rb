require 'test_helper'

class UserSearchTest < ActionDispatch::IntegrationTest

  test "when a user visits the search page they see the form" do
    create_user
    visit '/search'
    assert_equal search_path, current_path
    assert page.has_content?("Let's Get Started")
  end

  test "when a guest visits the seach page they don't see the form" do
    visit '/search'
    assert_equal search_path, current_path
    refute page.has_content?("Let's Get Started")
    assert page.has_content?("Please login to access this page")
  end

  test "user can submit all the fields of the form and get a results page" do
    
  end

end
