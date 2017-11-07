require 'test_helper'

class Team::RankingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_ranking_index_url
    assert_response :success
  end

end
