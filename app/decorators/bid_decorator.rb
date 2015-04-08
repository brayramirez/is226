class BidDecorator < ApplicationDecorator

  def panel_class
    return 'panel-default' if source.withdrawed?

    source.order.decorate.panel_class
  end

end
