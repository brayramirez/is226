module Buyer
  class MyAccountsController < Buyer::BaseController

    before_action :init_form, :only => [:edit, :update]


    def show
    end


    def edit
    end


    def update
      if @form.validate params[:user]
        @form.save

        flash[:success] = 'My Account successfully updated.'
        redirect_to [:buyer, :my_account]
      else
        flash[:error] = @form.errors.full_messages
        render :edit
      end
    end





    private

    def init_form
      @form = AccountForm.new current_user
    end

  end
end