module Bidder
  class BidsController < Bidder::BaseController

    before_action :init_order, :only => [:new, :create]
    before_action :init_new_bid, :only => [:new, :create]
    before_action :init_bid,
      :only => [:show, :edit, :update, :withdraw, :reopen]
    before_action :init_form, :only => [:new, :create, :edit, :update]
    before_action :init_bid_support, :only => [:withdraw, :reopen]


    def show
    end


    def new
      restrict_order
    end


    def create
      if @form.validate params[:bid]
        @form.save

        flash[:success] = 'You have successfuly made a bid.'
        redirect_to [:bidder, @form.model]
      else
        flash[:error] = @form.errors.full_messages
        render :new
      end
    end


    def edit
      restrict_bid
    end


    def update
      if @form.validate params[:bid]
        @form.save

        flash[:success] = 'You have successfuly updated your bid.'
        redirect_to [:bidder, @form.model]
      else
        flash[:error] = @form.errors.full_messages
        render :edit
      end
    end


    def withdraw
      @support.withdraw

      redirect_to [:bidder, @bid.order]
    end


    def reopen
      @support.reopen

      redirect_to [:bidder, @bid.order]
    end





    private

    def init_order
      @order = Order.find params[:order_id]
    end


    def init_new_bid
      @bid = @order.bids.new :bidder_account => current_role
    end


    def init_bid
      @bid = Bid.find params[:id]
    end


    def init_bid_support
      @support = BiddingSupport.new @bid
    end


    def init_form
      @form = BidForm.new @bid
    end


    def restrict_order
      return if @order.open?

      flash[:error] = "Order is already #{@bid.order.decorate.simple_status} and no bids can be made."
      redirect_to [:bidder, @order]
    end


    def restrict_bid
      return if @bid.editable?

      flash[:error] = "Order is already #{@bid.order.decorate.simple_status} and no bids can be made."
      redirect_to [:bidder, @bid.order]
    end

  end
end
