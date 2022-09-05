require 'test_helper'

class MusiclessonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get musiclesson_index_url
    assert_response :success
  end

  test "should get signup" do
    get musiclesson_signup_url
    assert_response :success
  end

end
