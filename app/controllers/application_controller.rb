class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    if user.is_a?(Broker::User)
      brokerage_path
    else
      super
    end
  end
end
