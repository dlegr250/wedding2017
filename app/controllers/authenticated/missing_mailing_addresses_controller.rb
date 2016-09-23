module Authenticated
  class MissingMailingAddressesController < BaseController
    before_action :set_page_title

    def index
      @parties = current_account.parties.missing_mailing_address.alphabetical.group_by { |p| p.name.first.upcase }
    end

    def update
      @party = get_party
      if @party.update_attributes(party_params)
        flash.now[:notice] = "Updated Mailing Address"
      else
        # NOOP
      end
    end

    private

    def get_party
      current_account.parties.find_by(uuid: params[:uuid])
    end

    def party_params
      params.require(:party).permit(
        :mailing_address
      )
    end

    def set_page_title
      @page_title = "Missing Addresses"
    end
  end
end
