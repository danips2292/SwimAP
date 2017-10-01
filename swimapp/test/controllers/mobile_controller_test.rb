require 'test_helper'

class MobileControllerTest < ActionDispatch::IntegrationTest
  test "should get assistance" do
    get mobile_assistance_url
    assert_response :success
  end

  test "should get ranking" do
    get mobile_ranking_url
    assert_response :success
  end

  test "should get comments" do
    get mobile_comments_url
    assert_response :success
  end

end
