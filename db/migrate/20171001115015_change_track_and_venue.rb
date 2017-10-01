class ChangeTrackAndVenue < ActiveRecord::Migration[5.1]
  def change
    remove_column :tracks, :event_id
    remove_column :tracks, :capacity
    add_column :venues, :description, :text
    add_column :venues, :capacity, :integer
    add_column :tracks, :venue_id, :integer
  end
end
