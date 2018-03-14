require 'test_helper'

class Lovers::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lovers_items_index_url
    assert_response :success
  end

  test "should get show" do
    get lovers_items_show_url
    assert_response :success
  end

end
