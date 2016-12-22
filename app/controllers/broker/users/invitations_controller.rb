module Broker
  class Users::InvitationsController < Devise::InvitationsController
    layout 'broker'

    before_action :set_brokerage_context, only: %i(new create edit)
    before_action :configure_permitted_parameters, if: :devise_controller?

    def update
      super do |resource|
        @brokerage = resource.brokerage
      end
    end

    protected

    def invite_resource
      super do |u|
        u.brokerage_id = current_broker_user.brokerage_id
      end
    end

    def authenticate_inviter!
      if admin_user_signed_in?
        current_admin_user
      else
        return nil unless broker_user_signed_in?
        return nil unless current_broker_user.is_owner
      end
    end

    def after_invite_path_for(_, _)
      broker_users_path
    end

    def set_brokerage_context
      @brokerage = (current_broker_user || resource).brokerage
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :phone])
      devise_parameter_sanitizer.permit(:invite, keys: [:first_name, :last_name, :is_owner])
    end
  end
end
