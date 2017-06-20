class AddSessionTypeToEventSession < ActiveRecord::Migration[5.1]
  def self.up
    change_table :event_sessions do |t|
      t.integer :session_type, default: 1, null:false
    end
  end
end
