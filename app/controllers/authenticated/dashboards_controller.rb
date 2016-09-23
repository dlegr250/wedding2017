module Authenticated
  class DashboardsController < BaseController
    before_action :set_page_title
    
    def show
    end

    private

    def set_page_title
      @page_title = "Dashboard"
    end
  end
end
