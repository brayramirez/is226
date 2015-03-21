module Admin
  class BuyersController < Admin::BaseController

    before_action :init_buyer, :only => [:show, :enable]


    def index
      @buyers = BuyerAccount.alphabetical
    end


    def show
    end


    def enable
      @buyer.update_attributes params.require(:buyer).permit(:disabled)
      flash[:notice] = "Buyer Account #{@buyer.disabled? ? 'disabled' : 'enable'}."

      redirect_to [:admin, @buyer]
    end





    private

    def init_buyer
      @buyer = BuyerAccount.find params[:id]
    end

  end
end
