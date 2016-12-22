require 'test_helper'

class InviteBrokerUserTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "inviting a new user to the brokerage should send them an email" do
    sign_in broker_users(:snow_admin), scope: :broker_user

    get '/broker/users'
    assert_response :success
    assert_select 'a[href="/broker/auth/invitation/new"]'

    get '/broker/auth/invitation/new'
    assert_response :success

    assert_difference 'Broker::User.count', 1 do
      post '/broker/auth/invitation', params: {
        broker_user: {
          email: 'foo@bar.com',
          first_name: 'Foo',
          last_name: 'Bar',
          is_owner: true
        }
      }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert_select_email do
      assert_select "a.invite-link" do |link|
        invitee = open_session
        destination = link[0].attributes["href"].value
        token = destination.split('invitation_token=')[-1]

        invitee.get destination
        invitee.assert_response :success

        assert_no_difference 'Broker::User.count' do
          assert_difference 'Broker::User.invitation_accepted.count', 1 do
            invitee.put '/broker/auth/invitation', params: {
              broker_user: {
                invitation_token: token,
                first_name: 'Berg',
                last_name: 'Dude',
                password: 'haxx112',
                password_confirmation: 'haxx112',
                phone: '111 222 3333'
              }
            }

            invitee.assert_response :redirect
            invitee.follow_redirect!
            invitee.assert_response :success

            invitee.get '/broker'
            invitee.assert_response :success
          end
        end
      end
    end
  end
end
