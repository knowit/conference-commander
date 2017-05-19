class RenameSingleRoomReasonColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :participations, :request_for_single_room, :request_for_sharing_room
  end
end
