# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string           not null
#  last_name              :string           not null
#  company_name           :string
#  contact_person         :string
#  contact_number         :string
#  disabled               :boolean          default(FALSE)
#  role_id                :integer
#  role_type              :string
#
# Indexes
#
#  index_users_on_confirmation_token     (confirmation_token) UNIQUE
#  index_users_on_reset_password_token   (reset_password_token) UNIQUE
#  index_users_on_role_id_and_role_type  (role_id,role_type)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
