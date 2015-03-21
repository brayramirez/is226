module Admin
  class AdminsController < Admin::BaseController

    before_action :init_admin, :only => [:show, :edit, :update, :destroy, :enable]


    def index
      @admins = AdminAccount.alphabetical
    end


    def show
    end


    def new
      @admin = AdminAccount.new
    end


    def create
      @admin = AdminAccount.new admin_params

      if @admin.save
        flash[:success] = 'Administrator Account successfully created.'
        redirect_to [:admin, :admins]
      else
        flash[:error] = @admin.errors.full_messages
        render :new
      end
    end


    def edit
    end


    def update
      if @admin.update_attributes admin_params
        flash[:success] = 'Administrator Account successfully updated.'
        redirect_to [:admin, @admin]
      else
        flash[:error] = @admin.errors.full_messages
        render :edit
      end
    end


    def destroy
      @admin.destroy
      flash[:notice] = 'Administrator Account successfully deleted.'

      redirect_to [:admin, :admins]
    end


    def enable
      @admin.update_attributes params.require(:user).permit(:disabled)
      flash[:notice] = "Administrator Account #{@admin.disabled? ? 'disabled' : 'enabled'}."

      redirect_to [:admin, @admin]
    end


    def reset_password
      @admin = AdminAccount.find params[:id]
      @admin.send_reset_password_instructions

      flash[:success] = 'Password reset instructions has been sent.'
      redirect_to [:admin, @admin]
    end





    private

    def init_admin
      @admin = AdminAccount.find params[:id]
    end


    def admin_params
      params.require(:user).permit :email, :last_name, :first_name
    end

  end
end
