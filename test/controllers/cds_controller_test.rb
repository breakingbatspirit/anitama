require 'test_helper'

class CdsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cds_new_url
    assert_response :success
  end

  test "should get index" do
    get cds_index_url
    assert_response :success
  end

  test "should get show" do
    get cds_show_url
    assert_response :success
  end

  test "should get edit" do
    get cds_edit_url
    assert_response :success
  end

  test "should get result" do
    get cds_result_url
    assert_response :success
  end

  test "should get top" do
    get cds_top_url
    assert_response :success
  end

end
