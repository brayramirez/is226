class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :choose_layout


  def after_sign_in_path_for resource
    path =
      if resource.admin?
        [:admin, :root]
      elsif resource.buyer?
        [:buyer, :root]
      elsif resource.bidder?
        [:bidder, :root]
      else
        [:root]
      end

    path
  end


  def after_sign_out_path_for resource
    [:root]
  end


  def restrict_page
    raise ActionController::RoutingError.new('Not Found')
  end





  private

  def choose_layout
    return 'application' unless current_user

    layout =
      if current_user.admin?
        'admin'
      elsif current_user.buyer?
        'buyer'
      elsif current_user.bidder?
        'bidder'
      end

    layout
  end

end
