module Bidder
  class OrdersController < Bidder::BaseController

    def index
      @orders = current_role.open_orders
    end


    def show
      @order = Order.find params[:id]
    end

  end
end
