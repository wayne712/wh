require 'test_helper'

class AcquiresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acquire = acquires(:one)
  end

  test "should get index" do
    get acquires_url
    assert_response :success
  end

  test "should get new" do
    get new_acquire_url
    assert_response :success
  end

  test "should create acquire" do
    assert_difference('Acquire.count') do
      post acquires_url, params: { acquire: {  } }
    end

    assert_redirected_to acquire_url(Acquire.last)
  end

  test "should show acquire" do
    get acquire_url(@acquire)
    assert_response :success
  end

  test "should get edit" do
    get edit_acquire_url(@acquire)
    assert_response :success
  end

  test "should update acquire" do
    patch acquire_url(@acquire), params: { acquire: {  } }
    assert_redirected_to acquire_url(@acquire)
  end

  test "should destroy acquire" do
    assert_difference('Acquire.count', -1) do
      delete acquire_url(@acquire)
    end

    assert_redirected_to acquires_url
  end
end
