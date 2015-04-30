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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  # :rememberable, :trackable, :registerable
  devise :database_authenticatable, :confirmable, :recoverable, :validatable


  belongs_to :role, :polymorphic => true

  has_many :comments,
    :foreign_key => :commenter_id,
    :dependent => :destroy

  scope :alphabetical, -> { order('last_name ASC, first_name ASC') }
  scope :admins, -> { where(:role_type => AdminAccount.to_s) }
  scope :buyers, -> { where(:role_type => BuyerAccount.to_s) }
  scope :bidders, -> { where(:role_type => BidderAccount.to_s) }


  # Validations
  validates :email, :presence => true, :uniqueness => true
  validates :last_name, :presence => true
  validates :first_name, :presence => true


  def to_s
    "#{self.first_name} #{self.last_name}"
  end
  alias_method :name, :to_s


  def admin?
    self.role.is_a? AdminAccount
  end


  def buyer?
    self.role.is_a? BuyerAccount
  end


  def bidder?
    self.role.is_a? BidderAccount
  end


  def non_admin?
    !self.admin?
  end


  def active?
    !self.disabled?
  end


  def password_required?
    return false if self.role.is_a?(AdminAccount) && self.new_record?

    super
  end

end
