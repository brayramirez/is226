class CreateAccountForm < AccountForm

  property :password
  property :password_confirmation


  validates :password, :presence => true, :confirmation => true

end