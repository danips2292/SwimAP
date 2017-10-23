require 'test_helper'

class User::PendingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_pending_index_url
    assert_response :success
  end

end
