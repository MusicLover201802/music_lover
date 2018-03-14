require 'test_helper'

class Lovers::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get lovers_genres_show_url
    assert_response :success
  end

end
