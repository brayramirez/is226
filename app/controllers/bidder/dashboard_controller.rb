module Bidder
  class DashboardController < Bidder::BaseController

    def index
      @orders = Order.open.recent_week.under_category current_user.category_ids
      @orders_with_bids = current_user.becomes(BidderAccount).orders_with_bids
    end

  end
end
