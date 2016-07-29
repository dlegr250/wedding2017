#======================================================================
# Parent for any controllers that require an authenticated user.
#======================================================================
module Authenticated
  class BaseController < ::ApplicationController
    layout "application"
    before_action :require_user

    def current_user
      if cookies[:user_authentication_token]
        @current_user ||= User.find_by(authentication_token: cookies[:user_authentication_token])
      end
    end
    helper_method :current_user

    private

    def require_user
      destroy_session_for_user("Must login before continuing") unless current_user.present?
    end

    def require_admin_user
      destroy_session_for_user("Admin user required for that action") unless current_user.present? && current_user.admin?
    end
  end
end
