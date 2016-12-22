class AdminUsers::SessionsController < Devise::SessionsController
  def dev_auth
    sign_in(:admin_user, AdminUser.first)
    redirect_to brokerage_path
  end
end
