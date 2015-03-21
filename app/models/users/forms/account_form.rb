class AccountForm < UserForm

  # property :account_type_name, :virtual => true
  property :account_type

  # property :buyer_type_name, :virtual => true
  property :buyer_type

  property :company_name
  property :contact_person
  property :contact_number

  property :categories, :virtual => true
  property :category_ids, :readable => false

  validate :presence_of_categories
  validate :presence_of_company_name


  def categories= ids = []
    self.category_ids = ids
  end


  def account_type
    super || :buyer
  end


  def buyer_type
    super || :business
  end


  def category_ids
    super || model.category_ids
  end


  def save
    super
  end





  protected

  def presence_of_categories
    if self.account_type.to_sym == :bidder && self.category_ids.blank?
      errors.add(:categories, 'is required')
    end
  end


  def presence_of_company_name
    if ((self.account_type.to_sym == :buyer && self.buyer_type.to_sym == :business) ||
      self.account_type.to_sym == :bidder) && self.company_name.blank?

      errors.add(:company_name, 'is required')
    end
  end

end