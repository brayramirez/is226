class HomeController < ApplicationController

  before_action :redirect_if_signed_in
  before_action :init_form


  def new
  end


  def create
    if @form.validate params[:user]
      @form.save

      flash[:success] = 'Confirmation Email has been sent. Please confirm account to proceed.'
      redirect_to new_user_session_path
    else
      render :new
    end
  end





  protected

  def redirect_if_signed_in
    return if current_user.blank?
    return if current_user.disabled?

    redirect_to [:admin, :root] and return if current_user.admin?
    redirect_to [:bidder, :root] and return if current_user.bidder?
    redirect_to [:buyer, :root] and return if current_user.buyer?
  end


  def init_form
    @form = CreateAccountForm.new User.new
  end

end
