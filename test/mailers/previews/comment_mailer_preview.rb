# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview

  def notify_bidder_concerned
    CommentMailer.notify_concerned Comment.find(2)
  end


  def notify_buyer_concerned
    CommentMailer.notify_concerned Comment.find(1)
  end

end
