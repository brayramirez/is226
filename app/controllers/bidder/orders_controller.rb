module Bidder
  class OrdersController < Bidder::BaseController

    before_action :init_order, :only => [:show]


    def index
      @state = params[:state].present? ? params[:state].to_sym : nil
      @orders = current_role.orders @state
    end


    def show
      restrict_order
    end





    protected

    def init_order
      @order = Order.find params[:id]
    end


    def restrict_order
      return if !@order.closed?

      flash[:error] = "Order is already closed."
      redirect_to [:bidder, :orders]
    end

  end
end
