class BuyerDashboardSupport

  attr_accessor :buyer, :user, :actions


  def initialize buyer = nil
    raise 'Buyer is required.' if buyer.nil?

    self.buyer = buyer
    self.user = self.buyer.user
    self.actions = []
  end


  def recent_activities
    extract_activities

    self.actions
  end





  protected

  def extract_activities
    orders = self.buyer.orders
    bids = Bid.where :order_id => orders.pluck(:id)
    comments = Comment.where :bid_id => bids.pluck(:id)

    recent_orders = orders.recent_week.group_by { |object| object.created_at.to_i }
    recent_bids = bids.recent_week.group_by { |object| object.created_at.to_i }
    recent_comments = comments.recent_week.group_by { |object| object.created_at.to_i }

    activities = recent_orders.merge(recent_bids) { |key, old_val, new_val| old_val + new_val }
    activities = activities.merge(recent_comments) { |key, old_val, new_val| old_val + new_val }

    keys = activities.keys.sort { |x, y| y <=> x }
    keys.each do |key|
      activities[key].each do |activity|
        action =
          if activity.is_a? Order
            "<b>You</b> created an order for item <b><a href='/buyer/orders/#{activity.id}'>#{activity.item}</a></b>."
          elsif activity.is_a? Bid
            "<b>#{activity.bidder}</b> made a bid for item <b><a href='/buyer/orders/#{activity.order.id}'>#{activity.order.item}</a></b>."
          elsif activity.is_a? Comment
            actor = activity.commenter == self.user ? 'You' : activity.commenter.name
            "<b>#{actor}</b> posted a comment to a bid for item <b><a href='/buyer/orders/#{activity.order.id}'>#{activity.order.item}</a></b>"
          end

        action += "<br/><small>- #{Time.at(key).strftime('%Y/%-m/%-d %l:%M %P')}</small>"
        self.actions << action
      end
    end
  end

end
