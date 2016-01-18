require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, location_categories: {"bars"=>"1"},
                address: "1975 Grant St, Denver, CO",
                distance_in_meters: 1609.34
    assert_response :success
  end

end
