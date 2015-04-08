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
#  account_type           :integer          default(0), not null
#  company_name           :string
#  contact_person         :string
#  contact_number         :string
#  buyer_type             :integer          default(0), not null
#  disabled               :boolean          default(FALSE)
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  # :rememberable, :trackable, :validatable, :registerable
  devise :database_authenticatable, :confirmable, :recoverable


  enum :account_type => [:buyer, :bidder, :admin] unless instance_methods.include? :account_type
  enum :buyer_type => [:business, :individual] unless instance_methods.include? :buyer_type


  has_many :orders,
    :dependent => :destroy
  has_many :bids,
    :foreign_key => :bidder_id,
    :dependent => :destroy
  has_many :comments,
    :foreign_key => :commenter_id,
    :dependent => :destroy
  has_and_belongs_to_many :categories,
    :join_table => :bidder_categories,
    :foreign_key => :user_id,
    :dependent => :destroy


  scope :admin, -> { where(:account_type => User.admin_type) }
  scope :buyer, -> { where(:account_type => User.buyer_type) }
  scope :bidder, -> { where(:account_type => User.bidder_type) }

  scope :alphabetical, -> { order('last_name ASC, first_name ASC') }


  # Validations
  validates :email, :presence => true, :uniqueness => true
  validates :last_name, :presence => true
  validates :first_name, :presence => true


  def self.admin_type
    User.account_types[:admin]
  end


  def self.buyer_type
    User.account_types[:buyer]
  end


  def self.bidder_type
    User.account_types[:bidder]
  end


  def self.business_type
    User.buyer_types[:business]
  end


  def self.individual_type
    User.buyer_types[:individual]
  end


  def to_s
    "#{self.first_name} #{self.last_name}"
  end
  alias_method :name, :to_s


  def admin?
    User.account_types[self.account_type] == User.admin_type
  end


  def buyer?
    User.account_types[self.account_type] == User.buyer_type
  end


  def bidder?
    User.account_types[self.account_type] == User.bidder_type
  end


  def non_admin?
    !self.admin?
  end


  def active?
    !self.disabled?
  end

end
