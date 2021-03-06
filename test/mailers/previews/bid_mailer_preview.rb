# Preview all emails at http://localhost:3000/rails/mailers/bid_mailer
class BidMailerPreview < ActionMailer::Preview

  def new_bid_notification
    BidMailer.new_bid_notification Bid.first
  end


  def withdraw_notification
    BidMailer.withdraw_notification Bid.first
  end


  def reopen_notification
    BidMailer.reopen_notification Bid.first
  end

end
