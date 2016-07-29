module Authentication
  class SessionsController < BaseController
    def new
      # NOOP - login form
    end

    # Submit login form
    def create
      user = User.find_by(email: params[:email])

      if user.present? && user.authenticate(params[:password])
        flash[:notice] = user.email
        create_session_for_user(user)
        redirect_to attendees_path
      else
        flash[:error] = "Invalid email or password"
        render :new
      end
    end

    # Logout
    def destroy
      destroy_session_for_user
    end
  end
end
