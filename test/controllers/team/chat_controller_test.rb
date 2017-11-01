require 'test_helper'

class Team::ChatControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_chat_index_url
    assert_response :success
  end

end
