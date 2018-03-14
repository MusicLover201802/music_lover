require 'test_helper'

class Lovers::EndControllerTest < ActionDispatch::IntegrationTest
  test "should get end" do
    get lovers_end_end_url
    assert_response :success
  end

end
