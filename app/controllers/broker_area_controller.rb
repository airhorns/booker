class BrokerAreaController < ApplicationController
  layout 'broker'

  before_action :authenticate_broker_or_admin_user!
  before_action :set_brokerage_context

  private

  def current_broker_user
    if admin_user_signed_in?
      @current_broker_user ||= Broker::User.new(first_name: "Super", last_name: "User", brokerage: Brokerage.first, id: -1)
    else
      super
    end
  end

  def set_brokerage_context
    @brokerage = current_broker_user.brokerage
  end

  def authenticate_broker_or_admin_user!
    admin_user_signed_in? || authenticate_broker_user!
  end
end
