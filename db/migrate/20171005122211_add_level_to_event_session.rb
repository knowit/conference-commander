class AddLevelToEventSession < ActiveRecord::Migration[5.1]
  def change
    change_table :event_sessions do |t|
      t.integer :level, null: false, default: 0
    end

    create_table :event_sessions_users do |t|
      t.references :event_session, null: false, index: true
      t.references :user, null: false, index: true
      t.timestamps
    end
  end
end
