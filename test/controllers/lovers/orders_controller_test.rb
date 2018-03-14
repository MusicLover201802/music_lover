require 'test_helper'

class Lovers::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get lovers_orders_new_url
    assert_response :success
  end

  test "should get show" do
    get lovers_orders_show_url
    assert_response :success
  end

end
