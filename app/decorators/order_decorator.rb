class OrderDecorator < ApplicationDecorator

  STATUS = ['Open', 'Awarded', 'Closed']


  def to_s
    source.item
  end


  def status
    STATUS[Order.statuses[source.status]]
  end


  def created_at
    source.created_at.strftime '%B %-d, %Y'
  end

end
