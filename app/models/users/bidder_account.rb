# == Schema Information
#
# Table name: bidder_accounts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BidderAccount < ActiveRecord::Base

  has_one :user,
    :as => :role,
    :dependent => :destroy

  has_and_belongs_to_many :categories,
    :join_table => :bidder_account_categories,
    :dependent => :destroy
  has_many :bids, :dependent => :destroy


  def self.model_name
    ActiveModel::Name.new(self, nil, 'Bidder')
  end


  def orders
    Order.where(:id => self.bids.pluck(:order_id))
  end


  def open_orders
    Order.open.by_latest.under_category self.category_ids
  end


  def open_orders_with_bids
    self.orders.open.by_latest
  end


  def awarded_orders
    self.orders.awarded.by_latest
  end

end
