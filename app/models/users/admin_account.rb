# == Schema Information
#
# Table name: admin_accounts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AdminAccount < ActiveRecord::Base

  has_one :user,
    :as => :role,
    :dependent => :destroy


  def self.model_name
    ActiveModel::Name.new(self, nil, 'Admin')
  end

end
