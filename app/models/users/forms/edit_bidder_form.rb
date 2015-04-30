class EditBidderForm < UserForm

  property :company_name
  property :contact_person
  property :contact_number

  property :categories, :virtual => true

  validate :presence_of_categories
  validate :presence_of_company_name


  def categories
    super || self.model.role.category_ids
  end


  def save
    self.model.role.category_ids = self.categories

    super
  end





  protected

  def presence_of_categories
    return if self.categories.present?

    errors.add(:categories, 'is required')
  end


  def presence_of_company_name
    return if self.company_name.present?

    errors.add(:company_name, 'is required')
  end

end