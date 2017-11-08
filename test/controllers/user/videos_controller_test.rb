require 'test_helper'

class User::VideosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_videos_index_url
    assert_response :success
  end

end
