class BidderDecorator < ApplicationDecorator

  def categories
    source.categories.alphabetical.pluck(:name).join(', ')
  end

end
