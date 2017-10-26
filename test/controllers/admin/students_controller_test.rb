require 'test_helper'

class Admin::StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_students_index_url
    assert_response :success
  end

end
