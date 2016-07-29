module Authentication
  class BaseController < ::ApplicationController
    layout "authentication"

    private

    def create_session_for_user(user)
      cookies[:user_authentication_token] = user.authentication_token
    end
  end
end
