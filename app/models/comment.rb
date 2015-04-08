# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  bid_id       :integer
#  commenter_id :integer
#  content      :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_comments_on_bid_id        (bid_id)
#  index_comments_on_commenter_id  (commenter_id)
#

class Comment < ActiveRecord::Base

  belongs_to :bid
  belongs_to :commenter, :class_name => 'User'


  scope :recent, -> { order('created_at DESC') }

end
