require 'test_helper'

class AboutusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aboutus_index_url
    assert_response :success
  end

  test "should get more" do
    get aboutus_more_url
    assert_response :success
  end

  test "should get partners" do
    get aboutus_partners_url
    assert_response :success
  end

end
