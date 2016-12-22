module Broker
  class UsersController < BrokerAreaController

  before_action :set_broker_user, only: [:show, :edit, :update, :destroy]

  def index
    @broker_users = Broker::User.all
  end

  def new
    @broker_user = Broker::User.new
  end

  def edit
  end

  def create
    @broker_user = Broker::User.new(broker_user_params)

    if @broker_user.save
      redirect_to @broker_user, notice: 'Brokerage user was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /broker_users/1
  def update
    if @broker_user.update(broker_user_params)
      redirect_to @broker_user, notice: 'Brokerage user was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /broker_users/1
  def destroy
    @broker_user.destroy
    redirect_to broker_users_url, notice: 'Brokerage user was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_broker_user
      @broker_user = Broker::User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def broker_user_params
      params.require(:broker_user).permit(:first_name, :last_name, :phone, :brokerage_id, :is_owner)
    end
  end
end
