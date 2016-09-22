module Authenticated
  class SaveTheDatesController < BaseController
    def index
      @parties = current_account.parties.save_the_date_not_sent.alphabetical.group_by { |p| p.name.first.upcase }
    end

    def update
      @party = get_party
      if @party.update_attributes(party_params)
        flash.now[:notice] = "Updated Party"
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
        :save_the_date_sent
      )
    end
  end
end
