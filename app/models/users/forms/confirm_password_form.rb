class ConfirmPasswordForm < Reform::Form

  model User

  property :password
  property :password_confirmation
  property :confirmation_token


  validates :password, :presence => true, :confirmation => true
  validates :confirmation_token, :presence => true


  def save
    super

    self.model.confirm!
  end

end