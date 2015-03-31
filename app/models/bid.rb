# == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  bidder_id  :integer
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_bids_on_bidder_id  (bidder_id)
#  index_bids_on_order_id   (order_id)
#

class Bid < ActiveRecord::Base

  belongs_to :order
  belongs_to :bidder, :class_name => 'User'
  has_many :comments, :dependent => :destroy


  def to_s
    self.content
  end

end
