module Authenticated
  class MailingAddressesController < BaseController
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
  end
end
