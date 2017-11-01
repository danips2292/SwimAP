require 'test_helper'

class Team::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_posts_index_url
    assert_response :success
  end

end
