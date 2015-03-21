module Admin
  class MyAccountsController < Admin::BaseController

    before_action :init_account, :only => [:edit, :update]


    def show
    end


    def edit
    end


    def update
      if @account.update_attributes account_params
        flash[:success] = 'My Account successfully updated.'
        redirect_to [:admin, :my_account]
      else
        flash[:error] = @account.errors.full_messages
        render :edit
      end
    end





    private

    def init_account
      @account = current_user
    end


    def account_params
      params.require(:user).permit :email, :last_name, :first_name
    end

  end
end
