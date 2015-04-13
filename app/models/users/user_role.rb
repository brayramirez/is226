# == Schema Information
#
# Table name: user_roles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  role_id    :integer
#  role_type  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_roles_on_role_type_and_role_id  (role_type,role_id)
#  index_user_roles_on_user_id                (user_id)
#

class UserRole < ActiveRecord::Base

  belongs_to :user
  belongs_to :role, :polymorphic => true

end
