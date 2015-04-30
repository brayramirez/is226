class EditBuyerForm < UserForm

  property :company_name
  property :contact_person
  property :contact_number

  property :buyer_type, :virtual => true

  validate :presence_of_company_name


  def buyer_type
    super || self.model.role.buyer_type
  end


  def save
    self.model.role.update_attributes :buyer_type => self.buyer_type

    super
  end





  protected

  def presence_of_company_name
    return if self.buyer_type.to_sym == :individual || self.company_name.present?

    errors.add(:company_name, 'is required')
  end

end