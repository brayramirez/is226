# == Schema Information
#
# Table name: bids
#
#  id                :integer          not null, primary key
#  order_id          :integer
#  bidder_account_id :integer
#  content           :text             not null
#  status            :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_bids_on_bidder_account_id  (bidder_account_id)
#  index_bids_on_order_id           (order_id)
#

class Bid < ActiveRecord::Base

  enum :status => [:open, :awarded, :withdrawed] unless instance_methods.include? :status


  scope :recent_week, -> { where 'DATE(bids.created_at) >= ?', 7.days.ago.to_date }


  belongs_to :order
  belongs_to :bidder_account

  has_many :attachments, :as => :owner, :dependent => :destroy
  has_many :comments, :dependent => :destroy


  validates :content, :presence => true


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


  def user
    self.bidder_account.user
  end
  alias_method :bidder, :user


  def editable?
    self.order.open?
  end

end
