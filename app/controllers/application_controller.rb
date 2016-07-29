class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  force_ssl if Rails.env.production?

  private

  # Accessible from multiple places, so makes sense to put it here.
  def destroy_session_for_user(msg = nil)
    cookies.delete(:user_authentication_token)
    flash[:error] = msg if msg.present?
    redirect_to login_path
  end
end
