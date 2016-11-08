class AccommodationsEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :accommodations_events, id: false do |t|
      t.integer :event_id, null: false
      t.integer :accommodation_id, null: false
    end
  end
end
