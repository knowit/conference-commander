class RemoveAttachmentPictureFromHotels < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :hotels, :picture
  end
end
