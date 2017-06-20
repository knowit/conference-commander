class RenameColumnInTracks < ActiveRecord::Migration[5.1]
  def change
    rename_column :tracks, :venues_id, :venue_id
    rename_column :event_sessions, :tracks_id, :track_id
  end
end
