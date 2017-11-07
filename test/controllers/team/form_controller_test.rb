require 'test_helper'

class Team::FormControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_form_index_url
    assert_response :success
  end

end
