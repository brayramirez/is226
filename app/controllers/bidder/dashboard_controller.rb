module Bidder
  class DashboardController < Bidder::BaseController

    def index
      @orders = current_role.categorized.recent_week
      @orders_with_bids = current_role.orders_with_bid(:open).recent_week
      @awarded_orders = current_role.orders_with_bid(:awarded).recent_week
      @activities = BidderDashboard.new(current_role).recent_activities
    end

  end
end
