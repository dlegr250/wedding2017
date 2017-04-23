module Authenticated
  class DashboardsController < BaseController
    before_action :set_page_title

    def show
      @attending = current_account.guests.attending.alphabetical.includes(:party)
      @not_attending = current_account.guests.not_attending.alphabetical.includes(:party)
      @not_rsvped = current_account.guests.not_rsvped.alphabetical.includes(:party)
    end

    private

    def set_page_title
      @page_title = "Dashboard"
    end
  end
end
