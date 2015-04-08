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
  end
end