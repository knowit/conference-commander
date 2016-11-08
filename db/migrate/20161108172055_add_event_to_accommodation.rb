class AddEventToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :event_id, :integer, null: false
    add_foreign_key :accommodations, :events
  end
end
