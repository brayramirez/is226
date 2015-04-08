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

require 'test_helper'

class BidTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
