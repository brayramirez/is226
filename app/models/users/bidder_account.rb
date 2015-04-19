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


  def orders_with_bid status = nil
    orders = Order.where(:id => self.bids.pluck(:order_id)).by_latest
    return orders if status.nil?

    return orders.awarded if status == :awarded

    orders.open
  end


  def categorized
    Order.open.by_latest.under_category self.category_ids
  end


  def orders status = nil
    return self.categorized if status.nil?
    return Order.open.by_latest if status == :all

    self.orders_with_bid status
  end

end
