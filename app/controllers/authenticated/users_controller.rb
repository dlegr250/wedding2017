module Authenticated
  class UsersController < BaseController
    def index
      @invited_users = User.unconfirmed.alphabetical
      @users = User.confirmed.alphabetical
    end

    def new
      @user = User.new
    end

    def create
      @user = ::Users::AsInvitation.new(invitation_params)
      if @user.save
        flash[:notice] = "Invitation sent"
        redirect_to users_path
      else
        flash[:error] = "Problem inviting user"
        render :new
      end
    end

    def show
      @user = get_user
    end

    def edit
      @user = get_user
    end

    def update
      @user = get_user
      if @user.update_attributes(user_params)
        flash[:notice] = "Updated User"
        redirect_to user_path(@user.uuid)
      else
        flash[:error] = "Problem updating User"
        render :edit
      end
    end

    def destroy
      @user = get_user

      if @user.admin?
        flash[:error] = "Cannot remove Admin user"
        redirect_to users_path
        return false
      end

      if @user.destroy
        flash[:notice] = "Removed #{@user.full_name}"
        redirect_to users_path
      else
        flash[:error] = "Problem deleting User"
        render :show
      end
    end

    private

    def invitation_params
      params.require(:user).permit(
        :email
      )
    end

    def user_params
      params.require(:user).permit(
        :email,
        :full_name
      )
    end

    def get_user
      User.find_by(uuid: params[:id])
    end
  end
end
