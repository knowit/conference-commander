class ParticipationsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :participations_users, id: false do |t|
      t.integer :participation_id, null: false
      t.integer :user_id, null: false
    end
  end
end
