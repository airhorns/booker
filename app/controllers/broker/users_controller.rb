module Broker
  class UsersController < BrokerAreaController

    before_action :set_broker_user, only: [:show, :edit, :update, :destroy]

    def index
      @broker_users = Broker::User.all
    end

    def edit
    end

    def update
      if @broker_user.update(broker_user_params)
        redirect_to @broker_user, notice: 'Brokerage user was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @broker_user.destroy
      redirect_to broker_users_url, notice: 'Brokerage user was successfully destroyed.'
    end

    private

    def set_broker_user
      @broker_user = Broker::User.find(params[:id])
    end

    def broker_user_params
      params.require(:broker_user).permit(:first_name, :last_name, :phone, :brokerage_id, :is_owner)
    end
  end
end
