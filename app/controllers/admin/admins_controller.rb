module Admin
  class AdminsController < Admin::BaseController

    before_action :init_admin,
      :only => [:show, :edit, :update, :destroy, :enable, :reset_password,
        :resend_confirmation]
    before_action :init_new_admin, :only => [:new, :create]
    before_action :init_form, :only => [:new, :create, :edit, :update]


    def index
      @admins = User.admins.alphabetical
    end


    def show
    end


    def new
    end


    def create
      if @form.validate params[:user]
        @form.save

        flash[:success] = 'Administrator Account successfully created.'
        redirect_to [:admin, :admins]
      else
        flash[:error] = @form.errors.full_messages
        render :new
      end
    end


    def edit
    end


    def update
      if @form.validate params[:user]
        @form.save

        flash[:success] = 'Administrator Account successfully updated.'
        redirect_to [:admin, @admin.role]
      else
        flash[:error] = @admin.errors.full_messages
        render :edit
      end
    end


    def destroy
      @admin = User.find params[:id]
      @admin.destroy
      flash[:notice] = 'Administrator Account successfully deleted.'

      redirect_to [:admin, :admins]
    end


    def enable
      @admin.update_attributes params.require(:user).permit :disabled
      flash[:notice] = "Administrator Account #{@admin.disabled? ? 'disabled' : 'enabled'}."

      redirect_to [:admin, @admin.role]
    end


    def reset_password
      @admin.send_reset_password_instructions

      flash[:success] = 'Password reset instructions has been sent.'
      redirect_to [:admin, @admin.role]
    end


    def resend_confirmation
      @admin.resend_confirmation_instructions

      flash[:success] = 'Confirmation has been sent.'
      redirect_to [:admin, @admin.role]
    end





    private

    def init_admin
      @admin = AdminAccount.find(params[:id]).user
    end


    def init_new_admin
      @admin = User.new
    end


    def init_form
      @form = AdminForm.new @admin
    end

  end
end
