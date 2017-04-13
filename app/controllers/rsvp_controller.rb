class RsvpController < ::ApplicationController
  layout "rsvp"
  before_action :set_page_title

  # Form to enter RSVP code
  def index
    @rsvp = Rsvp.new
  end

  # Process submission from RSVP code form
  def create
    @rsvp = Rsvp.new(rsvp_params)

    if @rsvp.valid?
      redirect_to rsvp_path(@rsvp.code)
    else
      render :index
    end
  end

  # Acts as the :edit action
  def show
    if @party = get_party

    else
      flash[:error] = "Invalid RSVP Code"
      redirect_to rsvp_index_path
    end
  end

  def update
    if @party = get_party
      Guest.update(guest_params.keys, guest_params.values)
      redirect_to thanks_rsvp_path(@party.rsvp_code)
    else
      flash[:error] = "Invalid RSVP Code"
      redirect_to rsvp_index_path
    end
  end

  def thanks
    if @party = get_party

    else
      flash[:error] = "Invalid RSVP Code"
      redirect_to rsvp_index_path
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:code)
  end

  def guest_params
    params.require(:guests)
  end

  def get_party
    # Party.includes(:guests).find_by(rsvp_code: params[:rsvp_code])
    Party.includes(:guests).where("UPPER(parties.rsvp_code) = ?", params[:rsvp_code].to_s.upcase).first #find_by(rsvp_code: params[:rsvp_code])
  end

  def set_page_title
    @page_title = "RSVP"
  end
end
