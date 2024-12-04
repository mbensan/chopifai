require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get add_item" do
    get carts_add_item_url
    assert_response :success
  end
end
