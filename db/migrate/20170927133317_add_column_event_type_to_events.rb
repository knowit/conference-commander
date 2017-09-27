class AddColumnEventTypeToEvents < ActiveRecord::Migration[5.1]
  def change
    change_table :events do |t|
      t.integer :event_type, default: 0, null: false
    end
  end
end
