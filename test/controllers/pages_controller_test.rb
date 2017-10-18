require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get cart" do
    get pages_cart_url
    assert_response :success
  end

end
