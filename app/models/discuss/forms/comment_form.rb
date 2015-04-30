class CommentForm < Reform::Form

  property :content


  def save
    super

    self.notify_concerned
  end





  protected

  def notify_concerned
    bid = self.model.bid
    recipient =
      self.model.commenter.role.is_a?(BidderAccount) ?
        bid.order.buyer :
        bid.bidder

    CommentMailer.notify_concerned(recipient, self.model).deliver_now
  end

end
