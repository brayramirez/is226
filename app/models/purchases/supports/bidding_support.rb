class BiddingSupport

  attr_accessor :bid


  def initialize bid
    raise TypeError unless bid.is_a?(Bid)

    self.bid = bid
  end


  def withdraw
    self.bid.update_attributes :status => Bid.withdrawed_status
    self.withdraw_notification
  end


  def reopen
    self.bid.update_attributes :status => Bid.open_status
    self.reopen_notification
  end





  protected

  def withdraw_notification
    BidMailer.withdraw_notification(self.bid).deliver_now
  end


  def reopen_notification
    BidMailer.reopen_notification(self.bid).deliver_now
  end

end
