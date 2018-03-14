require 'test_helper'

class Lovers::RootControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get lovers_root_top_url
    assert_response :success
  end

end
