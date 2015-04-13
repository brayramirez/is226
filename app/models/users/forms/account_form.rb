class AccountForm < UserForm

  ROLES = {:buyer => BuyerAccount, :bidder => BidderAccount}

  property :company_name
  property :contact_person
  property :contact_number

  property :categories, :virtual => true
  property :account_type, :virtual => true
  property :buyer_type, :virtual => true

  validate :presence_of_categories
  validate :presence_of_company_name


  def account_type
    super || :buyer
  end


  def buyer_type
    super || :business
  end


  def save
    self.model.role = self.assign_role if self.model.new_record?

    super
  end





  protected

  def presence_of_categories
    if self.account_type.to_sym == :bidder && self.categories.blank?
      errors.add(:categories, 'is required')
    end
  end


  def presence_of_company_name
    if ((self.account_type.to_sym == :buyer && self.buyer_type.to_sym == :business) ||
      self.account_type.to_sym == :bidder) && self.company_name.blank?

      errors.add(:company_name, 'is required')
    end
  end


  def assign_role
    role = ROLES[self.account_type.to_sym].new
    role.category_ids = self.categories if role.is_a? BidderAccount
    role.buyer_type = self.buyer_type if role.is_a? BuyerAccount
    role.save

    role
  end

end