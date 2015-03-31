module Bidder
  class BidsController < Bidder::BaseController

    before_action :init_order, :only => [:new, :create]
    before_action :init_new_bid, :only => [:new, :create]
    before_action :init_bid, :only => [:show, :edit, :update]


    def show
    end


    def new
    end


    def create
      @bid.assign_attributes bid_params

      if @bid.save
        redirect_to [:bidder, @order]
      else
        render :new
      end
    end


    def edit
    end


    def update
      if @bid.update_attributes bid_params
        redirect_to [:bidder, @bid.order]
      else
        render :edit
      end
    end





    private

    def init_order
      @order = Order.find params[:order_id]
    end


    def init_new_bid
      @bid = @order.bids.new :bidder_id => current_user.id
    end


    def init_bid
      @bid = Bid.find params[:id]
    end


    def bid_params
      params.require(:bid).permit(:content)
    end

  end
end
