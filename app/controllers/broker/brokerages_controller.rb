module Broker
  class BrokeragesController < BrokerAreaController
    def show
      @brokerage = current_broker_user.brokerage
    end
  end
end
