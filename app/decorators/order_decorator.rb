class OrderDecorator < ApplicationDecorator

  SIMPLE_STATUS = ['open', 'awarded', 'closed']
  STATUS = ['Open',
            'Awarded',
            'Closed (This order is no longer editable and no bidding can be made.)']

  PANEL_CLASS = ['panel-primary', 'panel-success', 'panel-default']


  def simple_status
    SIMPLE_STATUS[Order.statuses[source.status]]
  end


  def status user = nil
    raise 'User is required.' if user.blank?

    display = STATUS[Order.statuses[source.status]]
    return display if !source.awarded?
    return "#{display} to #{order.awarded_bid.bidder}" if user.buyer?

    order.awarded_bid.bidder == user ? "#{display} to you" : display
  end


  def budget
    h.number_with_delimiter source.budget
  end


  def categories
    source.categories.alphabetical.pluck(:name).join(', ')
  end


  def created_at
    source.created_at.strftime '%B %-d, %Y'
  end


  def target
    source.target.strftime '%B %-d, %Y'
  end


  def panel_class
    PANEL_CLASS[Order.statuses[source.status]]
  end

end
