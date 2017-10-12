require 'test_helper'

class Admin::RutinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_rutines_index_url
    assert_response :success
  end

end
