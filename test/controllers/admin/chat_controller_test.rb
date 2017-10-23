require 'test_helper'

class Admin::ChatControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_chat_index_url
    assert_response :success
  end

end
