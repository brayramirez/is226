module Admin
  class BuyersController < Admin::BaseController

    before_action :init_buyer, :only => [:show, :enable]


    def index
      @buyers = BuyerAccount.alphabetical
    end


    def show
    end


    def enable
      @buyer.update_attributes params.require(:user).permit(:disabled)
      flash[:notice] = "Buyer Account #{@buyer.disabled? ? 'disabled' : 'enabled'}."

      redirect_to [:admin, @buyer]
    end


    def reset_password
      @buyer = BuyerAccount.find params[:id]
      @buyer.send_reset_password_instructions

      flash[:success] = 'Password reset instructions has been sent.'
      redirect_to [:admin, @buyer]
    end





    private

    def init_buyer
      @buyer = BuyerAccount.find params[:id]
    end

  end
end
