# == Schema Information
#
# Table name: attachments
#
#  id                :integer          not null, primary key
#  owner_id          :integer
#  owner_type        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#
# Indexes
#
#  index_attachments_on_owner_type_and_owner_id  (owner_type,owner_id)
#

class Attachment < ActiveRecord::Base

  ALLOWED_CONTENT_TYPES = ['image/jpeg', 'image/png', 'application/pdf',
                            'application/doc', 'application/docx']


  scope :by_latest, -> { order('attachments.created_at DESC') }


  has_attached_file :file


  belongs_to :owner, :polymorphic => true


  validates_attachment :file,
    :content_type => {:content_type => ALLOWED_CONTENT_TYPES}


  def to_s
    self.file_file_name
  end

end
