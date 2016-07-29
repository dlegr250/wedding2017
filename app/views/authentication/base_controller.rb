#======================================================================
# Parent for any controllers that require an authenticated user.
#======================================================================
module Authenticated
  class BaseController < ::ApplicationController
    layout "application"
    before_action :require_user

    def current_user
      if cookies[:user_authentication_token]
        @current_user ||= User.includes(:account).find_by(authentication_token: cookies[:user_authentication_token])
      end
    end
    helper_method :current_user

    def current_account
      if current_user
        @current_account ||= current_user.account
      end
    end
    helper_method :current_account

    private

    def require_user
      destroy_session_for_user("Must login before continuing") unless current_user.present?
    end

    def require_admin_user
      destroy_session_for_user("Admin user required for that action") unless current_user.present? && current_user.admin?
    end

    def require_primary_user
      destroy_session_for_user("Primary user required for that action") unless current_user.present? && current_user.primary?
    end
  end

end
