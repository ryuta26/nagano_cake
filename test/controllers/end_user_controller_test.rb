require 'test_helper'

class EndUserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_user_index_url
    assert_response :success
  end

  test "should get show" do
    get end_user_show_url
    assert_response :success
  end

  test "should get edit" do
    get end_user_edit_url
    assert_response :success
  end

end
