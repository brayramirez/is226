class UserDecorator < ApplicationDecorator

  BUYER_TYPE = ['Business', 'Individual']


  def status
    source.disabled? ? 'Disabled' : 'Active'
  end


  def buyer_type
    source.role.buyer_type.capitalize
  end


  def categories
    source.role.categories.alphabetical.pluck(:name).join(', ')
  end

end
