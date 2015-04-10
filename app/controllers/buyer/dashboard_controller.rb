module Buyer
  class DashboardController < Buyer::BaseController

    def index
      # @orders = current_user.orders.open.by_latest.recent_week
    end

  end
end
