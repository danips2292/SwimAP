require 'test_helper'

class Team::RoutinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_routines_index_url
    assert_response :success
  end

end
