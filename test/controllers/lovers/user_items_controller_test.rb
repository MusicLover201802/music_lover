require 'test_helper'

class Lovers::UserItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get lovers_user_items_show_url
    assert_response :success
  end

end
