class Users::ConfirmationsController < Devise::ConfirmationsController

  before_action :init_user_from_mail, :only => [:show]
  before_action :init_user, :only => [:update]
  before_action :init_form, :only => [:show, :update]

  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    redirect_to [:root] unless @user
    super if @user.non_admin?
  end


  def update
    if @form.validate params[:user]
      @form.save

      redirect_to new_user_session_path
    else
      render :show
    end
  end





  private

  def init_user_from_mail
    confirmation_token =
      Devise.token_generator.digest User,
        :confirmation_token,
        params[:confirmation_token]

    @user = User.where(:confirmation_token => confirmation_token).first
  end


  def init_user
    @user = User.where(:confirmation_token => params[:user][:confirmation_token]).first
  end


  def init_form
    @form = ConfirmPasswordForm.new @user
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
