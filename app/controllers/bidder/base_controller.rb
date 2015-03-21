class Bidder::BaseController < BaseController
  # TODO: Redirect To Account Disabled page
  before_action :restrict_page, :if => :not_bidder?


  def restrict_non_bidder
    # unless current_user.bidder?
    #   path =
    #     if current_user.admin?
    #       [:admin, :root]
    #     elsif current_user.buyer?
    #       [:buyer, :root]
    #     else
    #       [:root]
    #     end

    #   redirect_to path and return
    # end
    puts 'REDIRECT!!!'

    restrict_page
  end


  def not_bidder?
    puts 'NOT BIDDER!!'
    puts !current_user.bidder?

    !current_user.bidder?
  end

end