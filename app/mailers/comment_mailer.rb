class CommentMailer < ApplicationMailer

  def notify_concerned comment
    @comment = comment
    @bid = @comment.bid

    if comment.commenter.role.is_a?(BidderAccount)
      @recipient = @bid.order.buyer
      @account = :buyer
    else
      @recipient = @bid.bidder
      @account = :bidder
    end

    @order = @bid.order

    mail :to => @recipient.email, :subject => 'Comment has been posted.'
  end

end
