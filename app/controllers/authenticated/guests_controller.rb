module Authenticated
  class GuestsController < BaseController
    def index
      @guests = current_account.guests.includes(:party).alphabetical
    end

    def new
      @guest = Guest.new
    end

    def create
      @guest = Guest.new(guest_params)
      if @guest.save
        flash[:notice] = "Guest created"
        redirect_to guests_path
      else
        flash[:error] = "Problem adding Guest"
        render :new
      end
    end

    def show
      @guest = get_guest
    end

    def edit
      @guest = get_guest
    end

    def update
      @guest = get_guest
      if @guest.update_attributes(guest_params)
        flash[:notice] = "Updated Guest"
        redirect_to guests_path
      else
        flash[:error] = "Problem updating Guest"
        render :edit
      end
    end

    def destroy
      @guest = get_guest

      if @guest.destroy
        flash[:notice] = "Removed Guest"
        redirect_to guests_path
      else
        flash[:error] = "Problem deleting Guest"
        render :show
      end
    end

    private

    def guest_params
      params.require(:guest).permit(
        :party_id,
        :full_name,
        alcoholic_beverage_ids: []
      ).merge(account: current_account)
    end

    def get_guest
      Guest.find_by(uuid: params[:id])
    end
  end
end
