class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super do |resource|
  #     # raise resource.disabled?.inspect
  #     if resource.disabled?
  #       sign_out resource
  #       redirect_to [:root] and return
  #     end

  #     # if resource.admin?
  #     #   redirect_to [:admin, :root] and return
  #     # elsif resource.buyer?
  #     #   redirect_to [:buyer, :root] and return
  #     # elsif resource.bidder?
  #     #   redirect_to [:bidder, :root] and return
  #     # else
  #     #   redirect_to [:root] and return
  #     # end
  #   end
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
