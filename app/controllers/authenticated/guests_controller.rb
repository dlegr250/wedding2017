module Authenticated
  class GuestsController < BaseController
    def index
      # @parties = current_account.parties.includes(:guests).alphabetical
      # @guests = current_account.guests.includes(:party).alphabetical
    end

    def new
      @party = get_party
      @guest = @party.guests.new
    end

    def create
      @party = get_party
      @guest = @party.guests.new(guest_params)
      if @guest.save
        flash[:notice] = "Guest created"
        redirect_to party_path(@party.uuid)
      else
        flash[:error] = "Problem adding Guest"
        render :new
      end
    end

    def show
      @party = get_party
      @guest = get_guest
    end

    def edit
      @party = get_party
      @guest = get_guest
    end

    def update
      @party = get_party
      @guest = get_guest
      if @guest.update_attributes(guest_params)
        flash[:notice] = "Updated Guest"
        redirect_to party_path(@party.uuid)
      else
        flash[:error] = "Problem updating Guest"
        render :edit
      end
    end

    def destroy
      @party = get_party
      @guest = get_guest

      if @guest.destroy
        flash[:notice] = "Removed Guest"
        redirect_to party_path(@party.uuid)
      else
        flash[:error] = "Problem deleting Guest"
        render :show
      end
    end

    private

    def guest_params
      params.require(:guest).permit(
        :full_name,
        alcoholic_beverage_ids: []
      ).merge(account: current_account)
    end

    def get_party
      @party ||= current_account.parties.find_by(uuid: params[:party_uuid])
    end

    def get_guest
      @guest ||= get_party.guests.find_by(uuid: params[:uuid])
    end
  end
end
