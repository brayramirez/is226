class AttachmentDecorator < ApplicationDecorator

  def created_at
    Time.at(source.created_at).strftime '%B %-d, %Y %l:%M %p'
  end

end
