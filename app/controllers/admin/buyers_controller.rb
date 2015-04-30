module Admin
  class BuyersController < Admin::BaseController

    before_action :init_buyer, :only => [:show, :enable, :reset_password]


    def index
      @buyers = User.buyers.alphabetical
    end


    def show
    end


    def enable
      @buyer.update_attributes params.require(:user).permit(:disabled)
      flash[:notice] = "Buyer Account #{@buyer.disabled? ? 'disabled' : 'enabled'}."

      redirect_to [:admin, @buyer.role]
    end


    def reset_password
      @buyer.send_reset_password_instructions

      flash[:success] = 'Password reset instructions has been sent.'
      redirect_to [:admin, @buyer.role]
    end





    private

    def init_buyer
      @buyer = BuyerAccount.find(params[:id]).user
    end

  end
end
