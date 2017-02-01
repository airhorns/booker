module Broker
  class AdminMasqueradesController < ApplicationController
    layout 'broker'

    before_filter :authenticate_admin_user!

    def index
      @brokerage = Brokerage.find(params[:brokerage_id])
      @broker_users = @brokerage.users
    end

    def create
      sign_in(:broker_user, Broker::User.find(params[:broker_user_id]))
      redirect_to brokerage_path
    end
  end
end
