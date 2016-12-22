require 'test_helper'

class Broker::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @broker_user = broker_users(:one)
  end

  test "should get index" do
    get broker_users_url
    assert_response :success
  end

  test "should get new" do
    get new_broker_user_url
    assert_response :success
  end

  test "should create broker_user" do
    assert_difference('Broker::User.count') do
      post broker_users_url, params: { broker_user: { brokerage_id: @broker_user.brokerage_id, first_name: @broker_user.first_name, is_owner: @broker_user.is_owner, last_name: @broker_user.last_name, phone: @broker_user.phone } }
    end

    assert_redirected_to broker_user_url(Broker::User.last)
  end

  test "should show broker_user" do
    get broker_user_url(@broker_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_broker_user_url(@broker_user)
    assert_response :success
  end

  test "should update broker_user" do
    patch broker_user_url(@broker_user), params: { broker_user: { brokerage_id: @broker_user.brokerage_id, first_name: @broker_user.first_name, is_owner: @broker_user.is_owner, last_name: @broker_user.last_name, phone: @broker_user.phone } }
    assert_redirected_to broker_user_url(@broker_user)
  end

  test "should destroy broker_user" do
    assert_difference('Broker::User.count', -1) do
      delete broker_user_url(@broker_user)
    end

    assert_redirected_to broker_users_url
  end
end
