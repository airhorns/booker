module Broker
  module UsersHelper
    def permissions_text(user)
      if user.is_owner
        "Administrator"
      else
        "Basic Permissions"
      end
    end
  end
end
