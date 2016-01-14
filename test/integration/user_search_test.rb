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

  test "user can submit all the yelp fields of the form and get a results page" do
    create_user
    visit '/search'
    check 'location_categories[bars]'
    check 'location_categories[cannabis_clinics]'
    check 'location_categories[hotels]'
    check 'location_categories[museums]'
    check 'location_categories[restaurants]'
    click_button "Find Your Night"

    assert_equal locations_path, current_path
  end

  test "user can submit all the eventbrite fields of the form and get a results page" do
    create_user
    visit '/search'
    check 'location_categories[events]'
    click_button "Find Your Night"

    assert_equal locations_path, current_path
  end

  test "if user doesn't check a box they do not get a results page" do
    create_user
    visit '/search'
    click_button "Find Your Night"

    assert_equal search_path, current_path
    assert page.has_content?("You must choose at least one category")
  end

end
