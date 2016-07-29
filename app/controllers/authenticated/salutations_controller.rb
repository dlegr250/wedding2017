module Authenticated
  class SalutationsController < BaseController
    def index
      @salutations = Salutation.alphabetical
    end

    def new
      @salutation = Salutation.new
    end

    def create
      @salutation = Salutation.new(salutation_params)
      if @salutation.save
        flash[:notice] = "Salutation created"
        redirect_to salutations_path
      else
        flash[:error] = "Problem adding Salutation"
        render :new
      end
    end

    def show
      @salutation = get_salutation
    end

    def edit
      @salutation = get_salutation
    end

    def update
      @salutation = get_salutation
      if @salutation.update_attributes(salutation_params)
        flash[:notice] = "Updated Salutation"
        redirect_to salutations_path
      else
        flash[:error] = "Problem updating Salutation"
        render :edit
      end
    end

    def destroy
      @salutation = get_salutation

      if @salutation.destroy
        flash[:notice] = "Removed Salutation"
        redirect_to salutations_path
      else
        flash[:error] = "Problem deleting Salutation"
        render :show
      end
    end

    private

    def salutation_params
      params.require(:salutation).permit(
        :value,
        :description
      )
    end

    def get_salutation
      Salutation.find_by(uuid: params[:id])
    end
  end
end
