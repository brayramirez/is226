class Dashboard

  attr_accessor :account

  DASHBOARDS = {
    :buyer_account => BuyerDashboard,
    :bidder_account => BidderDashboard
  }



  def initialize account = nil
    raise 'Account is required.' if account.nil?
    raise 'Invalid account.' unless ['BuyerAccount', 'BidderAccount'].include?(account.class.name)

    self.account = account
  end


  def recent_activities
    dashboard = DASHBOARDS[self.account.class.name.underscore.to_sym].new self.account
    dashboard.recent_activities
  end

end
