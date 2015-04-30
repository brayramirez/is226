class CommentDecorator < ApplicationDecorator

  def commenter current_user
    source.commenter == current_user ? 'You' : source.commenter
  end


  def created_at
    Time.at(source.created_at).strftime '%B %-d, %Y %l:%M %p'
  end

end
