require 'test_helper'

class BrokerageUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brokerage_user = brokerage_users(:one)
  end

  test "should get index" do
    get brokerage_users_url
    assert_response :success
  end

  test "should get new" do
    get new_brokerage_user_url
    assert_response :success
  end

  test "should create brokerage_user" do
    assert_difference('BrokerageUser.count') do
      post brokerage_users_url, params: { brokerage_user: { brokerage_id: @brokerage_user.brokerage_id, first_name: @brokerage_user.first_name, is_owner: @brokerage_user.is_owner, last_name: @brokerage_user.last_name, phone: @brokerage_user.phone } }
    end

    assert_redirected_to brokerage_user_url(BrokerageUser.last)
  end

  test "should show brokerage_user" do
    get brokerage_user_url(@brokerage_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_brokerage_user_url(@brokerage_user)
    assert_response :success
  end

  test "should update brokerage_user" do
    patch brokerage_user_url(@brokerage_user), params: { brokerage_user: { brokerage_id: @brokerage_user.brokerage_id, first_name: @brokerage_user.first_name, is_owner: @brokerage_user.is_owner, last_name: @brokerage_user.last_name, phone: @brokerage_user.phone } }
    assert_redirected_to brokerage_user_url(@brokerage_user)
  end

  test "should destroy brokerage_user" do
    assert_difference('BrokerageUser.count', -1) do
      delete brokerage_user_url(@brokerage_user)
    end

    assert_redirected_to brokerage_users_url
  end
end
