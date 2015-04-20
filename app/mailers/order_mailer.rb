class OrderMailer < ApplicationMailer

  def new_order_notification recipient, order
    @recipient = recipient
    @order = order

    mail :to => @recipient.email, :subject => 'New Order Request'
  end


  def congratulate_awardee recipient, order
    @recipient = recipient
    @order = order

    mail :to => @recipient.email,
      :subject => 'Congratulations! Order awarded.'
  end


  def order_awarded recipient, order
    @recipient = recipient
    @order = order

    mail :to => @recipient.email,
      :subject => 'Bidding is closed.'
  end


  def order_closed_notification recipient, order
    @recipient = recipient
    @order = order

    mail :to => @recipient.email,
      :subject => 'Bidding is closed.'
  end

end
