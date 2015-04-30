class CommentMailer < ApplicationMailer

  def notify_concerned recipient, comment
    @recipient = recipient
    @comment = comment
    @bid = @comment.bid
    @order = @bid.order
    @account = @recipient.role.is_a?(Buyer) ? :bidder : :buyer

    mail :to => @recipient.email, :subject => 'Comment has been posted.'
  end

end
