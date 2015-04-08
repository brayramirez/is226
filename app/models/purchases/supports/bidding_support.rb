class BiddingSupport

  attr_accessor :bid


  def initialize bid
    raise TypeError unless bid.is_a?(Bid)

    self.bid = bid
  end


  def withdraw
    self.bid.update_attributes :status => Bid.withdrawed_status
  end


  def reopen
    self.bid.update_attributes :status => Bid.open_status
  end

end