class RenameProposalsToEventSessions < ActiveRecord::Migration[5.1]
  def change
    rename_table :proposals, :event_sessions
  end
end
