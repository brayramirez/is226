module Bidder
  class DashboardController < Bidder::BaseController

    def index
      @orders = current_role.open_orders.recent_week
      @orders_with_bids = current_role.open_orders_with_bids
      @awarded_orders = current_role.awarded_orders
    end

  end
end
