require 'test_helper'

class Admin::VideosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_videos_index_url
    assert_response :success
  end

end
