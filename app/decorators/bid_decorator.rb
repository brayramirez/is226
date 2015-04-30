class BidDecorator < ApplicationDecorator

  STATUS = ['Open',
            'Awarded',
            'Withdrawed']


  def panel_class
    return 'panel-default' if source.withdrawed?

    source.order.decorate.panel_class
  end


  def status
    STATUS[Bid.statuses[source.status]]
  end

end
