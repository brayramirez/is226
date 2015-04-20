class OrderClosingSupport

  attr_accessor :order


  def initialize order
    raise 'Order is required' if order.blank?

    self.order = order
  end


  def close!
    self.order.close!
    self.notify_bidders
  end





  protected

  def notify_bidders
    self.order.bids.each do |bid|
      OrderMailer.order_closed_notification(bid.bidder, self.order).deliver_now
    end
  end

end
