module Authentication
  class PasswordResetsController < BaseController
    # Form to request new password reset
    def new
      # NOOP
    end

    # If user exists, generates token and emails user with URL
    def create
      user = User.find_by(email: params[:email])

      if user
        user.update_attributes(password_reset_token: ::Modules::Generator.random_token, password_reset_token_sent_at: Time.now)
        Mailer.password_reset_email(user).deliver_later
      end

      redirect_to login_path, notice: "Email sent with instructions"
    end

    # Form to enter new password.
    # Using #show instead of #edit as this makes
    # the URL more user-friendly (no trailing /edit).
    def show
      if @user = User.find_by(password_reset_token: params[:id])
        if @user.password_reset_token_expired?
          flash[:error] = "Your password reset has expired"
          redirect_to new_password_reset_path
        end
      else
        flash[:error] = "Invalid password reset token"
        redirect_to new_password_reset_path
      end
    end

    # Change the user's password
    def update
      @user = User.find_by(password_reset_token: params[:id])

      if @user.update_password(password_reset_params)
        redirect_to login_path, notice: "Password has been reset"
      else
        render :show
      end
    end

    private

    def password_reset_params
      params.require(:user).permit(:password, :password_confirmation)
    end
  end
end
