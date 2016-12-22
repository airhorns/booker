class BrokerAreaController < ApplicationController
  layout 'broker'

  before_action :authenticate_broker_or_admin_user!
  before_action :set_brokerage_context

  private

  def authenticate_broker_or_admin_user!
    admin_user_signed_in? || authenticate_broker_user!
  end

  def set_brokerage_context
    @brokerage = current_broker_user.brokerage
  end
end
