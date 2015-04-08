# == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  bidder_id  :integer
#  content    :text             not null
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_bids_on_bidder_id  (bidder_id)
#  index_bids_on_order_id   (order_id)
#

class Bid < ActiveRecord::Base

  enum :status => [:open, :awarded, :withdrawed] unless instance_methods.include? :status


  belongs_to :order
  belongs_to :bidder, :class_name => 'User'
  has_many :comments, :dependent => :destroy


  def self.open_status
    Bid.statuses[:open]
  end


  def self.awarded_status
    Bid.statuses[:awarded]
  end


  def self.withdrawed_status
    Bid.statuses[:withdrawed]
  end


  def open?
    Bid.statuses[self.status] == Bid.open_status
  end


  def awarded?
    Bid.statuses[self.status] == Bid.awarded_status
  end


  def withdrawed?
    Bid.statuses[self.status] == Bid.withdrawed_status
  end


  def to_s
    self.content
  end

end
