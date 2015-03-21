class AccountPasswordForm < Reform::Form

  model User

  property :current_password, :virtual => true
  property :password
  property :password_confirmation


  validates :current_password, :presence => true
  validate :authenticate_current_password
  validates :password, :presence => true, :confirmation => true
  validate :password_changed





  protected

  def authenticate_current_password
    if self.current_password.present? && !model.valid_password?(self.current_password)
      errors.add(:current_password, 'invalid')
    end
  end


  def password_changed
    if self.current_password.present? && self.password.present? &&
      self.current_password == self.password

      errors.add(:password, 'is already in use')
    end
  end

end