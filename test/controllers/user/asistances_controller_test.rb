require 'test_helper'

class User::AsistancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_asistances_index_url
    assert_response :success
  end

end
