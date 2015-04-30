class BidMailer < ApplicationMailer

  def new_bid_notification bid
    @bid = bid
    @order = @bid.order
    @recipient = @order.buyer


    mail :to => @recipient.email, :subject => 'A bid has been made.'
  end


  def withdraw_notification bid
    @bid = bid
    @order = @bid.order
    @recipient = @order.buyer

    mail :to => @recipient.email, :subject => 'Bid has been withdrawn'
  end


  def reopen_notification bid
    @bid = bid
    @order = @bid.order
    @recipient = @order.buyer

    mail :to => @recipient.email, :subject => 'Bid has been re-opened'
  end

end
