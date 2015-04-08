module Buyer
  class BidsController < Buyer::BaseController

    before_action :init_bid, :only => [:show, :award]


    def show
    end


    def award
      AwardingSupport.new(@bid.order, @bid).award

      redirect_to [:buyer, @bid.order]
    end





    private

    def init_bid
      @bid = Bid.find params[:id]
    end

  end
end
