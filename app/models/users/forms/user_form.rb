class UserForm < Reform::Form

  extend ActiveModel::ModelValidations

  copy_validations_from User

  model User


  property :email
  property :first_name
  property :last_name

end