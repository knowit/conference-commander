# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  imageable_type    :string
#  imageable_id      :integer
#  created_at        :datetime
#  updated_at        :datetime
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#

class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_attached_file :file
  validates_attachment :file,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
