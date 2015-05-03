class CommentForm < Reform::Form

  property :content


  def save
    super

    self.notify_concerned
  end





  protected

  def notify_concerned
    bid = self.model.bid

    CommentMailer.notify_concerned(self.model).deliver_now
  end

end
