class UserDecorator < ApplicationDecorator

  BUYER_TYPE = ['Business', 'Individual']


  def status
    source.disabled? ? 'Disabled' : 'Active'
  end


  def buyer_type
    source.buyer_type.capitalize
  end


  def categories
    source.categories.alphabetical.pluck(:name).join(', ')
  end

end
