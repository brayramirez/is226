class OrderDecorator < ApplicationDecorator

  STATUS = ['Open',
            'Awarded',
            'Closed (This order is no longer editable and no bidding can be made.)']

  PANEL_CLASS = ['panel-primary', 'panel-success', 'panel-default']


  def status
    STATUS[Order.statuses[source.status]]
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
