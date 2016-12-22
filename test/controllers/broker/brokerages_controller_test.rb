require 'test_helper'

class BrokeragesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brokerage = brokerages(:snowbroker)
    sign_in broker_users(:snow_admin), scope: :broker_user
  end

  test "should get show for signed in user" do
    get brokerage_url
    assert_response :success
  end
end
