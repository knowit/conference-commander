class ChangeEventSessions < ActiveRecord::Migration[5.1]
  def change
    rename_column :event_sessions, :user_id, :submitter_id

    change_table :event_sessions do |t|
      t.text :outline
      t.datetime :start_time
      t.integer :state, default: 0
      t.references :tracks, null: true
      t.integer :language, default: 0
    end

    remove_column :tracks, :start_at
    remove_column :tracks, :end_at
    change_table :tracks do |t|
      t.references :venues
      t.text :name
      t.integer :capacity
    end

    create_table :attachments do |t|
      t.references :attachable, polymorphic: true, index: true
      t.timestamps null: true
    end
    add_attachment :attachments, :file
  end
end
