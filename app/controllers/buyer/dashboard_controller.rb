module Buyer
  class DashboardController < Buyer::BaseController

    def index
      @orders = current_role.orders.open.by_latest.recent_week
      @awarded_orders = current_role.orders.awarded.by_latest.recent_week
    end

  end
end
