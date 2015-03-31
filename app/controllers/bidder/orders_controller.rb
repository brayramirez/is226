module Bidder
  class OrdersController < Bidder::BaseController

    def index
      @orders = Order.open.under_category current_user.category_ids
    end


    def show
      @order = Order.find params[:id]
    end

  end
end
