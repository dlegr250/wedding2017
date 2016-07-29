module Authentication
  class ConfirmationsController < BaseController
    def show
      @user = get_user

      if @user.confirmed?
        flash[:notice] = "Invitation already confirmed, please login"
        redirect_to login_path
      end
    end

    def update
      @user = get_user

      if @user.confirmed?
        flash[:notice] = "Invitation already confirmed, please login"
        redirect_to login_path
      end

      if @user.confirm(user_params)
        create_session_for_user(@user)
        redirect_to applications_path
      else
        flash[:error] = "Problem confirming your invitation"
        render :show
      end
    end

    private

    def get_user
      ::Users::AsConfirmation.find_by(confirmation_token: params[:id])
    end

    def user_params
      params.require(:user).permit(
        :full_name,
        :password,
        :password_confirmation
      )
    end
  end
end
