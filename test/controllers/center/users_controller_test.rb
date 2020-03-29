require 'test_helper'

class Center::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @center_user = center_users(:one)
  end

  test "should get index" do
    get center_users_url
    assert_response :success
  end

  test "should get new" do
    get new_center_user_url
    assert_response :success
  end

  test "should create center_user" do
    assert_difference('Center::User.count') do
      post center_users_url, params: { center_user: {  } }
    end

    assert_redirected_to center_user_url(Center::User.last)
  end

  test "should show center_user" do
    get center_user_url(@center_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_center_user_url(@center_user)
    assert_response :success
  end

  test "should update center_user" do
    patch center_user_url(@center_user), params: { center_user: {  } }
    assert_redirected_to center_user_url(@center_user)
  end

  test "should destroy center_user" do
    assert_difference('Center::User.count', -1) do
      delete center_user_url(@center_user)
    end

    assert_redirected_to center_users_url
  end
end
