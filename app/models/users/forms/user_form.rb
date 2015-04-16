class UserForm < Reform::Form

  model User


  property :email
  property :first_name
  property :last_name


  validates :email, :presence => true, :uniqueness => true
  validates :last_name, :presence => true
  validates :first_name, :presence => true

end
