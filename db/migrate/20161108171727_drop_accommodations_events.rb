class DropAccommodationsEvents < ActiveRecord::Migration[5.0]
  def change
    drop_table :accommodations_events
  end
end
