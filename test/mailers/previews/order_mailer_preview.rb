# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  def new_order_notification
    OrderMailer.new_order_notification BidderAccount.first.user, Order.first
  end


  def congratulate_awardee
    OrderMailer.congratulate_awardee BidderAccount.first.user, Order.first
  end


  def order_awarded
    OrderMailer.order_awarded BidderAccount.first.user, Order.first
  end


  def order_closed_notification
    OrderMailer.order_closed_notification BidderAccount.first.user, Order.first
  end

end
