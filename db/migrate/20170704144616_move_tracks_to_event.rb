class MoveTracksToEvent < ActiveRecord::Migration[5.1]
  def change
    rename_column :tracks, :venue_id, :event_id
  end
end
