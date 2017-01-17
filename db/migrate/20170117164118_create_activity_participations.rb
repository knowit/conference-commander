class CreateActivityParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_participations do |t|
      t.belongs_to :user
      t.belongs_to :activity
      t.timestamps
    end
  end
end
