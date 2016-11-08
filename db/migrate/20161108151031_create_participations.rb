class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.boolean :single_room, default: false
      t.references :user, foreign_key: true, null: false
      t.references :event, foreign_key: true, null: false
      t.references :accommodation, foreign_key: true

      t.timestamps
    end
    add_index :participations, [:user_id, :event_id], unique: true
  end
end
