module Admin
  class BiddersController < Admin::BaseController

    before_action :init_bidder, :only => [:show, :enable]


    def index
      @bidders = BidderAccount.alphabetical
    end


    def show
    end


    def enable
      @bidder.update_attributes params.require(:bidder).permit(:disabled)
      flash[:notice] = "Bidder Account #{@bidder.disabled? ? 'disabled' : 'enable'}."

      redirect_to [:admin, @bidder]
    end





    private

    def init_bidder
      @bidder = BidderAccount.find params[:id]
    end

  end
end