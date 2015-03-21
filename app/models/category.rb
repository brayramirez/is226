# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base

  # has_and_belongs_to_many :bidders


  scope :alphabetical, -> { order('name ASC') }


  validates :name, :presence => true, :uniqueness => true


  def to_s
    self.name
  end

end
