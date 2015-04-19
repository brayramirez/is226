module Bidder
  class OrdersController < Bidder::BaseController

    def index
      @state = params[:state].present? ? params[:state].to_sym : nil
      @orders = current_role.orders @state
    end


    def show
      @order = Order.find params[:id]
    end

  end
end
