module Authentication
  class SessionsController < BaseController
    before_action :set_page_title

    def new
      # NOOP - login form
    end

    # Submit login form
    def create
      user = User.find_by(email: params[:email])

      if user.present? && user.authenticate(params[:password])
        flash[:notice] = user.email
        create_session_for_user(user)
        redirect_to parties_path
      else
        flash[:error] = "Invalid email or password"
        render :new
      end
    end

    # Logout
    def destroy
      destroy_session_for_user
    end

    private

    def set_page_title
      @page_title = "Login"
    end
  end
end
