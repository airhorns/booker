class BrokerageUsersController < ApplicationController
  layout 'brokerage'

  before_action :set_brokerage_user, only: [:show, :edit, :update, :destroy]

  # GET /brokerage_users
  def index
    @brokerage_users = BrokerageUser.all
  end

  # GET /brokerage_users/1
  def show
  end

  # GET /brokerage_users/new
  def new
    @brokerage_user = BrokerageUser.new
  end

  # GET /brokerage_users/1/edit
  def edit
  end

  # POST /brokerage_users
  def create
    @brokerage_user = BrokerageUser.new(brokerage_user_params)

    if @brokerage_user.save
      redirect_to @brokerage_user, notice: 'Brokerage user was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /brokerage_users/1
  def update
    if @brokerage_user.update(brokerage_user_params)
      redirect_to @brokerage_user, notice: 'Brokerage user was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /brokerage_users/1
  def destroy
    @brokerage_user.destroy
    redirect_to brokerage_users_url, notice: 'Brokerage user was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brokerage_user
      @brokerage_user = BrokerageUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def brokerage_user_params
      params.require(:brokerage_user).permit(:first_name, :last_name, :phone, :brokerage_id, :is_owner)
    end
end
