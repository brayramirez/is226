class OrderForm < Reform::Form

  property :item
  property :quantity
  property :budget
  property :target
  property :details

  property :categories, :virtual => true
  property :category_ids, :readable => false

  validates :item, :presence => true
  validates :quantity, :numericality => true
  validates :budget, :numericality => true
  validate :presence_of_categories


  model Order


  def categories= ids = []
    self.category_ids = ids
  end


  def category_ids
    super || model.category_ids
  end


  def save
    new_record = self.model.new_record?

    super

    self.notify_bidders if new_record
  end




  protected

  def presence_of_categories
    errors.add(:categories, 'is required') if self.category_ids.blank?
  end


  def notify_bidders
    bidders = BidderAccount.under_category self.model.category_ids

    bidders.each do |bidder|
      OrderMailer.new_order_notification(bidder.user, self.model).deliver_now
    end
  end

end
