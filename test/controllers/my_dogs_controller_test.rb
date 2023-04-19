require "test_helper"

class MyDogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get my_dogs_new_url
    assert_response :success
  end

  test "should get edit" do
    get my_dogs_edit_url
    assert_response :success
  end
end
