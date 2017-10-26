require 'test_helper'

class Admin::DocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_documents_index_url
    assert_response :success
  end

end
