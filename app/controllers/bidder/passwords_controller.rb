module Bidder
  class PasswordsController < Bidder::BaseController

    before_action :init_form, :only => [:edit, :update]


    def edit
    end


    def update
      if @form.validate params[:user]
        @form.save
        sign_in @form.model, :bypass => true

        flash[:success] = 'Password has been updated.'
        redirect_to [:bidder, :my_account]
      else
        flash[:error] = @form.errors.full_messages
        render :edit
      end
    end





    private

    def init_form
      @form = AccountPasswordForm.new current_user
    end

  end
end
