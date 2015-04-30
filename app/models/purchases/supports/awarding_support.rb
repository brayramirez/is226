class AwardingSupport

  attr_accessor :order, :bid


  def initialize order, bid
    raise TypeError unless order.is_a?(Order)
    raise TypeError unless bid.is_a?(Bid)

    self.order = order
    self.bid = bid
  end


  def award
    self.bid.update_attributes :status => Bid.awarded_status
    self.order.update_attributes :status => Order.awarded_status

    self.confirm_awardee
    self.notify_other_bidders
  end





  protected

  def confirm_awardee
    OrderMailer.congratulate_awardee(self.bid.bidder,
      self.order).deliver_now
  end


  def notify_other_bidders
    bids = self.order.bids.where('id <> ?', self.bid)
    bids.each do |bid|
      OrderMailer.order_awarded(bid.bidder, self.order).deliver_now
    end
  end

end
