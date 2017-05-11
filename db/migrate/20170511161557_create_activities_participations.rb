class CreateActivitiesParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :activities_participations do |t|
      t.integer :activity_id, null: false, index: true
      t.integer :participation_id, null: false, index: true
    end
  end
end
