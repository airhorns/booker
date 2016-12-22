class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_broker_user
    if admin_user_signed_in?
      @current_broker_user ||= Broker::User.new(first_name: "Super", last_name: "User", brokerage: Brokerage.first, id: -1, is_owner: true)
    else
      super
    end
  end

  def after_sign_in_path_for(user)
    if user.is_a?(Broker::User)
      brokerage_path
    else
      super
    end
  end
end
