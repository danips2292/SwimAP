require 'test_helper'

class InitialFormsControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get initial_forms_register_url
    assert_response :success
  end

end
