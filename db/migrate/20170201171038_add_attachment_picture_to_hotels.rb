class AddAttachmentPictureToHotels < ActiveRecord::Migration
  def self.up
    change_table :hotels do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :hotels, :picture
  end
end
