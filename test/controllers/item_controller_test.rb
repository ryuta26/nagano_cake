require 'test_helper'

class ItemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get item_index_url
    assert_response :success
  end

  test "should get show" do
    get item_show_url
    assert_response :success
  end

  test "should get edit" do
    get item_edit_url
    assert_response :success
  end

  test "should get top" do
    get item_top_url
    assert_response :success
  end

end
