class RemoveSchedule < ActiveRecord::Migration[5.1]
  def change
    drop_table :schedules, force: :cascade
    remove_column :tracks, :schedule_id
  end
end
