module AdminUsers
  class SessionsController < Devise::SessionsController
    def dev_auth
      sign_in(:admin_user, AdminUser.first)
      redirect_to admin_masquerades_path(brokerage_id: params[:brokerage_id] || Brokerage.first.id)
    end
  end
end
