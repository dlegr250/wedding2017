module Authenticated
  class GuestsController < BaseController
    def index
      @guests = Guest.includes(:party).alphabetical
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
        :salutation_id,
        :full_name,
        :phone_number,
        :email,
        :address1,
        :address2,
        :city,
        :state,
        :zip,
        :number_invited,
        :number_attending,
        :notes,
        :wedding_gift,
        :party,
        :sent_save_the_date,
        :sent_invitation,
        :delivery_format,
        :number_who_drink
      )
    end

    def get_guest
      Guest.find_by(uuid: params[:id])
    end
  end
end
