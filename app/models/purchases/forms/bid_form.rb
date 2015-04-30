class BidForm < Reform::Form

  property :content


  validates :content, :presence => true


  def save
    new_record = self.model.new_record?

    super

    self.notify_buyer if new_record
  end





  protected

  def notify_buyer
    BidMailer.new_bid_notification(self.model).deliver_now
  end

end
