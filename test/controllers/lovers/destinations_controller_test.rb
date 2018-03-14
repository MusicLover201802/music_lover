require 'test_helper'

class Lovers::DestinationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get lovers_destinations_new_url
    assert_response :success
  end

end
