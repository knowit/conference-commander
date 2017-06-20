class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true
  has_attached_file :file
  # TODO: Consider doing some rudimentary file validations here (such as type and mimetype)
end