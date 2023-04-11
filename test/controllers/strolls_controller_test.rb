require "test_helper"

class StrollsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get strolls_new_url
    assert_response :success
  end

  test "should get index" do
    get strolls_index_url
    assert_response :success
  end

  test "should get edit" do
    get strolls_edit_url
    assert_response :success
  end
end
