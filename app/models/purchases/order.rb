# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item       :string           not null
#  quantity   :integer          default(0)
#  budget     :decimal(8, 2)    default(0.0)
#  target     :date
#  details    :text
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#

class Order < ActiveRecord::Base

  enum :status => [:open, :awarded, :closed] unless instance_methods.include? :status

  scope :by_latest, -> { order('created_at DESC') }
  scope :open, -> { where :status => self.open_status }


  belongs_to :user

  has_many :bids, :dependent => :destroy
  has_one :awarded_bid,
    -> { where :status => Bid.statuses[:awarded] },
    :class_name => 'Bid'
  has_and_belongs_to_many :categories, :join_table => :order_categories,
    :foreign_key => :order_id, :dependent => :destroy


  def self.open_status
    Order.statuses[:open]
  end


  def self.awarded_status
    Order.statuses[:awarded]
  end


  def self.closed_status
    Order.statuses[:closed]
  end


  def self.under_category ids
    joins(:categories).where('categories.id IN (?)', ids).uniq
  end


  def has_bid? bidder
    self.bid_by(bidder).present?
  end


  def bid_by bidder
    self.bids.where(:bidder_id => bidder.id).first
  end


  def to_s
    self.item
  end


  def open?
    Order.statuses[self.status] == Order.open_status
  end


  def awarded?
    Order.statuses[self.status] == Order.awarded_status
  end


  def closed?
    [Order.closed_status, Order.awarded_status].include? Order.statuses[self.status]
  end


  def editable?
    self.open? && self.no_of_bids == 0
  end


  def no_of_bids
    self.bids.count
  end


  def close!
    self.update_attributes :status => :closed
  end

end
