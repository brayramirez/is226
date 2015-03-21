class Buyer::BaseController < BaseController
  # TODO: Redirect To Account Disabled page
  before_action :restrict_page, :if => :not_buyer?


  def restrict_non_buyer
    # unless current_user.buyer?
    #   path =
    #     if current_user.admin?
    #       [:admin, :root]
    #     elsif current_user.bidder?
    #       [:bidder, :root]
    #     else
    #       [:root]
    #     end

    #   redirect_to path and return
    # end
    puts 'REDIRECT!!!'

    restrict_page
  end


  def not_buyer?
    puts 'NOT BUYER!!'
    puts !current_user.buyer?

    !current_user.buyer?
  end

end