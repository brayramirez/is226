class BidderDashboard

  attr_accessor :bidder, :user, :actions


  def initialize bidder = nil
    raise 'Bidder is required.' if bidder.nil?

    self.bidder = bidder
    self.user = self.bidder.user
    self.actions = []
  end


  def recent_activities
    extract_activities

    self.actions
  end





  protected

  def extract_activities
    bids = self.bidder.bids
    comments = Comment.where :bid_id => bids.pluck(:id)

    recent_bids = bids.recent_week.group_by { |object| object.created_at.to_i }
    recent_comments = comments.recent_week.group_by { |object| object.created_at.to_i }

    activities = recent_bids.merge(recent_comments) { |key, old_val, new_val| old_val + new_val }

    keys = activities.keys.sort { |x, y| y <=> x }
    keys.each do |key|
      activities[key].each do |activity|
        action =
          if activity.is_a? Bid
            "<b>You</b> made a bid for item <b><a href='/bidder/bids/#{activity.id}'>#{activity.order.item}</a></b>."
          elsif activity.is_a? Comment
            actor = activity.commenter == self.user ? 'You' : activity.commenter.name
            "<b>#{actor}</b> posted a comment to your bid for item <b><a href='/bidder/bids/#{activity.bid.id}'>#{activity.order.item}</a></b>"
          end

        action += "<br/><small>- #{Time.at(key).strftime('%Y/%-m/%-d %l:%M %P')}</small>"
        self.actions << action
      end
    end
  end

end
