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

require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
