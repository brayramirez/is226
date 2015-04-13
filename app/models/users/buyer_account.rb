# == Schema Information
#
# Table name: buyer_accounts
#
#  id         :integer          not null, primary key
#  buyer_type :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BuyerAccount < ActiveRecord::Base

  enum :buyer_type => [:business, :individual] unless instance_methods.include? :buyer_type


  has_one :user,
    :as => :role,
    :dependent => :destroy

  has_many :orders, :dependent => :destroy


  def self.model_name
    ActiveModel::Name.new(self, nil, 'Buyer')
  end

end
