require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get fillForm" do
    get user_fillForm_url
    assert_response :success
  end

end
