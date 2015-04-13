class Admin::BaseController < BaseController
  # TODO: Redirect To Account Disabled page
  before_action :restrict_page, :if => :not_admin?


  def restrict_non_admin
    # unless current_user.admin?
    #   path =
    #     if current_user.buyer?
    #       [:buyer, :root]
    #     elsif current_user.bidder?
    #       [:bidder, :root]
    #     else
    #       [:root]
    #     end

    #   redirect_to path and return
    # end
    puts 'REDIRECT!!!'

    # redirect_to root_url
    restrict_page
  end


  def not_admin?
    puts 'NOT ADMIN??'
    puts !current_user.admin?

    !current_user.admin?
  end

end