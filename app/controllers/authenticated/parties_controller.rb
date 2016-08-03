module Authenticated
  class PartiesController < BaseController
    def index
      @parties = current_account.parties.includes(:guests).alphabetical.group_by { |p| p.name.first.upcase }
    end

    def new
      @party = current_account.parties.new
    end

    def create
      @party = current_account.parties.new(party_params)
      if @party.save
        flash[:notice] = "Party created"
        redirect_to parties_path
      else
        flash[:error] = "Problem adding Party"
        render :new
      end
    end

    def show
      @party = get_party
    end

    def edit
      @party = get_party
    end

    def update
      @party = get_party
      if @party.update_attributes(party_params)
        flash[:notice] = "Updated Party"
        redirect_to parties_path
      else
        flash[:error] = "Problem updating Party"
        render :edit
      end
    end

    def destroy
      @party = get_party

      if @party.destroy
        flash[:notice] = "Removed Party"
        redirect_to parties_path
      else
        flash[:error] = "Problem deleting Party"
        render :show
      end
    end

    private

    def party_params
      params.require(:party).permit(
        :name
      )
    end

    def get_party
      current_account.parties.find_by(uuid: params[:uuid])
    end
  end
end
