module Admin
  class BiddersController < Admin::BaseController

    before_action :init_bidder, :only => [:show, :enable]


    def index
      @bidders = BidderAccount.alphabetical
    end


    def show
    end


    def enable
      @bidder.update_attributes params.require(:user).permit(:disabled)
      flash[:notice] = "Bidder Account #{@bidder.disabled? ? 'disabled' : 'enabled'}."

      redirect_to [:admin, @bidder]
    end


    def reset_password
      @bidder = BidderAccount.find params[:id]
      @bidder.send_reset_password_instructions

      flash[:success] = 'Password reset instructions has been sent.'
      redirect_to [:admin, @bidder]
    end





    private

    def init_bidder
      @bidder = BidderAccount.find params[:id]
    end

  end
end