require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get store_home_url
    assert_response :success
  end

end
