# == Schema Information
#
# Table name: attachments
#
#  id                :integer          not null, primary key
#  attachable_type   :string
#  attachable_id     :integer
#  created_at        :datetime
#  updated_at        :datetime
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#

class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true
  has_attached_file :file
  # TODO: Consider doing some rudimentary file validations here (such as type and mimetype)
end
