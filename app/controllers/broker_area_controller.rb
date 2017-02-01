class BrokerAreaController < ApplicationController
  layout 'broker'

  before_action :authenticate_broker_or_admin_user!
  before_action :set_brokerage_context

  private

  def authenticate_broker_or_admin_user!
    if !broker_user_signed_in? && admin_user_signed_in?
      redirect_to broker_admin_masquerade_path
    else
      authenticate_broker_user!
    end
  end

  def set_brokerage_context
    @brokerage = current_broker_user.brokerage
  end
end
