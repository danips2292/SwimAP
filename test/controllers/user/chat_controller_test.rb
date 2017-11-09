require 'test_helper'

class User::ChatControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_chat_index_url
    assert_response :success
  end

end
