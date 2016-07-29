module Authenticated
  class AttendeesController < BaseController
    def index
      @attendees = Attendee.alphabetical
    end

    def new
      @attendee = Attendee.new
    end

    def create
      @attendee = Attendee.new(attendee_params)
      if @attendee.save
        flash[:notice] = "Attendee created"
        redirect_to users_path
      else
        flash[:error] = "Problem adding Attendee"
        render :new
      end
    end

    def show
      @attendee = get_attendee
    end

    def edit
      @attendee = get_attendee
    end

    def update
      @attendee = get_attendee
      if @attendee.update_attributes(attendee_params)
        flash[:notice] = "Updated Attendee"
        redirect_to attendee_path(@attendee.uuid)
      else
        flash[:error] = "Problem updating Attendee"
        render :edit
      end
    end

    def destroy
      @attendee = get_attendee

      if @attendee.destroy
        flash[:notice] = "Removed Attendee"
        redirect_to attendees_path
      else
        flash[:error] = "Problem deleting Attendee"
        render :show
      end
    end

    private

    def attendee_params
      params.require(:attendee).permit(
        :full_name
      )
    end

    def get_attendee
      Attendee.find_by(uuid: params[:id])
    end
  end
end
