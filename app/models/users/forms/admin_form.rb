class AdminForm < UserForm

  def role
    return self.model.role if self.model.persisted?

    AdminAccount
  end


  def save
    self.model.role = self.role.create if self.model.new_record?

    super
  end

end