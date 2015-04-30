# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  buyer_account_id :integer
#  item             :string           not null
#  quantity         :integer          default(0)
#  budget           :decimal(8, 2)    default(0.0)
#  target           :date
#  details          :text
#  status           :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_orders_on_buyer_account_id  (buyer_account_id)
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
